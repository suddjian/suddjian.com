// import Matter from "matter-js";
// import * as images from "./preloadImages";

/**
 * TODO
 * 🗸 slimes spawn on their own,
 * 🗸 slimes damage the buildings,
 * 🗸 buildings have different healths,
 * some critical population center or something (game over screen),
 * merging with the hot new slime,
 * improving graphics/ux/art
 *
 * nice-to-have:
 * 🗸 bombs damage buildings,
 * slimes have a chance to spawn after eating,
 * batteries required to store energy,
 * 🗸 plants produce less when damaged,
 * at least one more way to damage slimes (flame turret!),
 * 🗸 power plant lifecycle,
 * intro sequence (hopefully with some cool art?)
 * credits
 */

const Vec = Matter.Vector;

const RIGHT = Vec.create(1, 0);
const ZERO = Vec.create(0, 0);

const EPSILON = 0.0000001;

const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d", { alpha: false });

const images = loadImages();

const TILE_SIZE = 32;
const TILE_HALF = TILE_SIZE / 2;
const GRID_WIDTH = 17;
const GRID_HEIGHT = 17;
const GRID_MARGIN = 4; // space to let slime creep around the outside of the grid

canvas.width = GRID_WIDTH * TILE_SIZE + GRID_MARGIN * 2;
canvas.height = GRID_HEIGHT * TILE_SIZE + GRID_MARGIN * 2;

let points = [];
let energy = 8;
const energyDisplay = document.getElementById("energy");
setEnergy(energy);

function setEnergy(e) {
  energy = e;
  energyDisplay.innerText = energy;
}

let cursorPos = Vec.create(canvas.width + 1, canvas.height + 1); // outside the world

// a layer of information on the tile grid
let buildingLayer = new Float32Array(GRID_WIDTH * GRID_HEIGHT); // a grid of 32px tiles
let buildingDamageLayer = new Float32Array(GRID_WIDTH * GRID_HEIGHT);
let timerLayer = new Float32Array(GRID_WIDTH * GRID_HEIGHT);

let selectedAction = null; // string id of action type
let ovumPlaced = false;
let youLost = false;

// building codes are classified by the 10's place.
// 1's place is used for modifiers.
// ideally each of these has a corresponding image.
const BLDG_NONE = 0;
const BLDG_CLASS_WALL = 1;
const BLDG_WALL = 10;
const BLDG_WALL_DAMAGED = 11;
const BLDG_CLASS_PLANT = 2;
const BLDG_PLANT = 20;
const BLDG_PLANT_DAMAGED = 21;
// const BLDG_CLASS_BOOM = 3;
// const BLDG_BOOM = 30; // todo make boom a building that flashes before blowing up
// const BLDG_CLASS_FLAMER = 4;
// const BLDG_FLAMER = 40;
const BLDG_CLASS_OVUM = 5;
const BLDG_OVUM = 50;
const BLDG_OVUM_DAMAGED = 51;

const buildingImages = {
  [BLDG_WALL]: images.wall,
  [BLDG_WALL_DAMAGED]: images.wall_dmg,
  [BLDG_PLANT]: images.plant,
  [BLDG_PLANT_DAMAGED]: images.plant_dmg,
  [BLDG_OVUM]: images.ovum,
  [BLDG_OVUM_DAMAGED]: images.ovum_dmg
};

const buildingClassHealths = {
  [BLDG_CLASS_WALL]: 12,
  [BLDG_CLASS_PLANT]: 0.5,
  // [BLDG_CLASS_BOOM]: Infinity,
  // [BLDG_CLASS_FLAMER]: 4
  [BLDG_CLASS_OVUM]: 12
};

const invincibleBuildings = [
  // BLDG_BOOM
];

function layerIndex(gridPoint) {
  return gridPoint.y * GRID_WIDTH + gridPoint.x;
}

function getFromLayer(layer, gridPoint) {
  return layer[layerIndex(gridPoint)] || 0;
}

function setInLayer(layer, gridPoint, val) {
  const index = layerIndex(gridPoint);
  if (index < 0 || index >= layer.length) return;
  layer[index] = val;
}

function* layerContents(layer) {
  for (let y = 0; y < GRID_HEIGHT; y++) {
    for (let x = 0; x < GRID_WIDTH; x++) {
      const coord = Vec.create(x, y);
      const content = getFromLayer(layer, coord);
      if (content) {
        yield [coord, content];
      }
    }
  }
}

function screen2grid(point) {
  return Vec.create(
    Math.floor((point.x - GRID_MARGIN) / TILE_SIZE),
    Math.floor((point.y - GRID_MARGIN) / TILE_SIZE)
  );
}

function grid2screen(point) {
  return Vec.create(
    point.x * TILE_SIZE + GRID_MARGIN,
    point.y * TILE_SIZE + GRID_MARGIN
  );
}

function setSelectedAction(id) {
  selectedAction = id;
  document.body.style.cursor = id ? `url(img/${id}.png), auto` : null;
}

document.querySelectorAll(".storeItem").forEach((siEl) => {
  const id = siEl.id;
  const btn = siEl.querySelector("button.select");
  btn.addEventListener("click", (e) => {
    setSelectedAction(id);
    e.stopPropagation();
  });
});

function spawnSlime(pos) {
  const slime = {
    pos: pos,
    theta: Math.random() * Math.PI * 2,
    hue: Math.random() * 255
  };
  points.push(slime);
  return slime;
}

const btnSpawnSlime = document.getElementById("spawnSlime");
btnSpawnSlime.addEventListener("click", (e) => {
  const amount = Math.min(maxPoints - points.length, 1000);
  for (let i = 0; i < amount; i++) {
    spawnSlime(
      Vec.create(randRange(0, canvas.width), randRange(0, canvas.height))
    );
  }
});

const btnCheatEnergy = document.getElementById("cheatEnergy");
btnCheatEnergy.addEventListener("click", (e) => {
  setEnergy(energy + 1000);
});

// document.addEventListener("mousemove", (e) => {
//   cursorPos = mouse2canvas(e.clientX, e.clientY);
//   spawnSlime(cursorPos);
// });

const actionBuild = (building) => (canvCoord) => {
  const gridCoord = screen2grid(canvCoord);
  if (getFromLayer(buildingLayer, gridCoord) === BLDG_NONE) {
    // add the selected building to the scene
    setInLayer(buildingLayer, gridCoord, building);
    if (building === BLDG_PLANT) {
      setInLayer(timerLayer, gridCoord, genPlantTimer());
    } else if (building === BLDG_OVUM) {
      ovumPlaced = true;
      setSelectedAction(null);
      document.getElementById("game").className = "started";
    }
    return true; // success
  }
};

// functions to call when an action is used
const actions = {
  wall: { cost: 4, act: actionBuild(BLDG_WALL) },
  plant: { cost: 8, act: actionBuild(BLDG_PLANT) },
  boom: { cost: 18, act: actionBoom },
  ovum: { cost: 0, act: actionBuild(BLDG_OVUM) }
};

document.querySelectorAll(".cost").forEach((costEl) => {
  const { id } = costEl.closest(".storeItem");
  costEl.innerText = actions[id].cost;
});

canvas.addEventListener("click", (e) => {
  const canvCoord = mouse2canvas(e.clientX, e.clientY);
  const action = actions[selectedAction];
  if (action && action.cost <= energy) {
    const where = Vec.add(canvCoord, Vec.create(16, 16));
    const success = action.act(where);
    if (success) {
      setEnergy(energy - action.cost);
    }
  }
});

document.body.addEventListener("keypress", function (e) {
  if (e.key === "Escape") {
    selectedAction = null;
  }
});

const boomInnerR = 80; // alien slime inside this radius is destroyed
const boomOuterR = 140; // but boom with care because slime inside this radius is launched
const boomInnerRSq = boomInnerR * boomInnerR; // to avoid sqrt()
const boomOuterRSq = boomOuterR * boomOuterR;
const boomLaunchForceMin = 400;
const boomLaunchForceMax = 1400;
const launchAirResistance = 0.8; // (0-1) lowering this increases resistance
const boomBuildingDmg = 0.5;

function launchSlime(slime, direction, force) {
  slime.launchVel = Vec.mult(direction, force);
  slime.launchDirection = direction;
}

function actionBoom(where) {
  const deaduns = new Set();
  drawBoom(where, boomInnerR);
  points.forEach((point, i) => {
    const dOrigin = Vec.sub(point.pos, where); // points from origin to point
    const distSq = Vec.magnitudeSquared(dOrigin);
    if (distSq < boomInnerRSq) {
      deaduns.add(i);
      drawBoom(point.pos, 20);
    } else if (distSq < boomOuterRSq) {
      const direction = Vec.normalise(dOrigin);
      const dist = Vec.magnitude(dOrigin);
      const launchModifier = 1 / (dist / (boomOuterR - boomInnerR));
      const launchForce = randRange(boomLaunchForceMin, boomLaunchForceMax);
      launchSlime(point, direction, launchForce * launchModifier);
      // drawBoom(point.pos, 15);
    }
  });
  points = points.filter((p, i) => !deaduns.has(i));
  // damage buildings
  for (const [gridCoord] of layerContents(buildingLayer)) {
    const screenCoord = grid2screen(gridCoord);
    const tileCenter = Vec.create(
      screenCoord.x + TILE_HALF,
      screenCoord.y + TILE_HALF
    );
    const distSq = Vec.magnitudeSquared(Vec.sub(where, tileCenter));
    if (distSq < boomInnerRSq) {
      damageBuilding(gridCoord, boomBuildingDmg);
    }
  }
  return true;
}

function drawBoom(where, r) {
  ctx.beginPath();
  ctx.arc(Math.floor(where.x), Math.floor(where.y), r, 0, Math.PI * 2);
  ctx.closePath();
  ctx.fillStyle = `white`;
  ctx.fill();
}

function drawPoints() {
  for (const point of points) {
    // if (point.launchVel) {
    // drawBoom(point, Vec.magnitude(point.launchVel));
    // }
    ctx.beginPath();
    ctx.arc(
      Math.floor(point.pos.x),
      Math.floor(point.pos.y),
      1,
      0,
      Math.PI * 2
    );
    ctx.closePath();
    ctx.fillStyle = `hsl(${point.hue}, 100%, 50%)`;
    ctx.fill();
  }
}

function drawBuildings() {
  for (const [pos, buildingCode] of layerContents(buildingLayer)) {
    const buildingType = Math.floor(buildingCode);
    const img = buildingImages[buildingType];
    if (img) {
      ctx.drawImage(
        img,
        pos.x * TILE_SIZE + GRID_MARGIN,
        pos.y * TILE_SIZE + GRID_MARGIN
      );
    }
  }
}

function drawShadowImage(...args) {
  const alphaBefore = ctx.globalAlpha;
  ctx.globalAlpha = 0.5;
  ctx.drawImage(...args);
  ctx.globalAlpha = alphaBefore;
}

function drawLoseState() {
  ctx.fillStyle = "rgba(0, 0, 0, 0.3)";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.font = "bold 30px Comic Sans MS";
  ctx.fillStyle = "rgba(256, 0, 0, 0.8)";
  ctx.textAlign = "center";
  ctx.fillText("YOU WERE DESTROYED", canvas.width / 2, canvas.height / 2);
}

let gameTimer = 0;
let lastFrameTime = 0;

function draw() {
  const frameStartTime = Date.now();
  // seconds since last frame
  const dt = lastFrameTime ? (frameStartTime - lastFrameTime) / 1000 : 1 / 60;
  gameTimer += dt;

  ctx.fillStyle = "rgba(0, 0, 0, 0.05)"; // genius mode activated
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  // if (ovumPlaced) {
  updatePoints(dt);
  updateBuildings(dt);
  // }
  drawBuildings();
  drawPoints();
  if (youLost) {
    drawLoseState();
  }

  lastFrameTime = frameStartTime;
  requestAnimationFrame(draw);
}

const energyGenIntervalMin = 2;
const energyGenIntervalMax = 5;

function genPlantTimer() {
  return randRange(energyGenIntervalMin, energyGenIntervalMax);
}

const buildingEnergies = {
  [BLDG_OVUM]: 0.8,
  [BLDG_OVUM_DAMAGED]: 1,
  [BLDG_PLANT]: 1,
  [BLDG_PLANT_DAMAGED]: 0.5
};

function updateBuildings(dt) {
  for (const [coord, buildingCode] of layerContents(buildingLayer)) {
    const buildingType = Math.floor(buildingCode);
    const energyGen = buildingEnergies[buildingType];
    if (energyGen) {
      // power plants will generate energy roughly every [interval] seconds
      let timer = getFromLayer(timerLayer, coord) - dt * energyGen;
      if (timer <= 0) {
        setEnergy(energy + 1);
        timer = genPlantTimer(coord);
      }
      setInLayer(timerLayer, coord, timer);
    }
  }
}

function damageBuilding(coord, amount) {
  const buildingCode = getFromLayer(buildingLayer, coord);
  const buildingType = Math.floor(buildingCode);
  if (buildingType in invincibleBuildings) return;
  const buildingClass = Math.floor(buildingCode / 10);
  const currentDamage = getFromLayer(buildingDamageLayer, coord) + amount;
  const buildingHP = buildingClassHealths[buildingClass];
  if (currentDamage > buildingHP) {
    // destroyed!
    setInLayer(buildingDamageLayer, coord, 0);
    setInLayer(buildingLayer, coord, BLDG_NONE);
    if (buildingClass === BLDG_CLASS_OVUM) {
      console.log("you get nothing! you lose! good day sir!");
      youLost = true;
      actionBoom(grid2screen(coord));
    }
    return true;
  } else if (currentDamage > buildingHP * 0.5 && buildingType % 10 === 0) {
    // activate the damage state
    const frac = buildingCode % 1;
    setInLayer(buildingLayer, coord, buildingType + 1 + frac);
  }
  setInLayer(buildingDamageLayer, coord, currentDamage);
}

// these are all now per second
const dthetaMax = Math.PI * 6;
const dhueMax = 500;
const speed = 20;
let slimeSpawnRate = 3;
let slimeSpawnAccel = 0.2;
const slimeSpawnRateMax = 10;
let spawnRateIncreaseAt = 10; // seconds
const spawnRateIncreaseMultiplier = Math.E; // just 'cuz
const maxPoints = 10000; // 10k is max loop iterations in firefox

function updatePoints(dt) {
  for (const point of points) {
    point.pos = nextSporePos(point, dt);
    point.theta += randRange(-dthetaMax, dthetaMax) * dt;
    //theta: Math.atan2(cursor[1] - point.pos[1], cursor[0] - point.pos[0]),
    point.hue += randRange(-dhueMax, dhueMax) * dt;
    point.launchVel = nextLaunchVel(point, dt);
  }
  slimeSpawnRate += slimeSpawnAccel * dt;
  if (points.length < maxPoints && Math.random() < dt * slimeSpawnRate) {
    // const whichSide = Math.floor(randRange(0, 4));
    let pos = null;
    // switch (whichSide) {
    //   case 0:
    //     // spawn to the north
    pos = Vec.create(randRange(0, canvas.width), 0);
    //   break;
    // case 1:
    //   // spawn to the east
    //   pos = Vec.create(canvas.width, randRange(0, canvas.height));
    //   break;
    // case 2:
    //   // spawn to the south
    //   pos = Vec.create(randRange(0, canvas.width), canvas.height);
    //   break;
    // default:
    //   // spawn to the west
    //   pos = Vec.create(0, randRange(0, canvas.height));
    //   break;
    // }
    spawnSlime(pos);
  }
}

const slimeBuildingDmgRate = 0.1;
const slimeBreedWhenDestroy = 5;
const slimeBreedLaunchMin = 50;
const slimeBreedLaunchMax = 800;

const slimeFeedSpawnByBuilding = {
  [BLDG_CLASS_OVUM]: 100,
  [BLDG_CLASS_PLANT]: 4
};

function attackBuilding(spore, dt, gridCoord, buildingCode) {
  const buildingClass = Math.floor(buildingCode * 0.1);
  const isDestroyed = damageBuilding(gridCoord, slimeBuildingDmgRate * dt);
  const feedSpawnCount = slimeFeedSpawnByBuilding[buildingClass];
  if (isDestroyed && feedSpawnCount) {
    // spawn more slime!
    for (let i = 0; i < feedSpawnCount; i++) {
      const slime = spawnSlime(spore.pos);
      const launchForce = randRange(slimeBreedLaunchMin, slimeBreedLaunchMax);
      const launchDir = Vec.rotate(RIGHT, randRange(0, Math.PI * 2));
      launchSlime(slime, launchDir, launchForce);
    }
  }
  return isDestroyed;
}

function nextSporePos(spore, dt) {
  let gridCoord = screen2grid(spore.pos);
  let building = getFromLayer(buildingLayer, gridCoord);
  let isFeeding =
    building && slimeFeedSpawnByBuilding[Math.floor(building * 0.1)];

  let next = spore.pos;
  if (!isFeeding) {
    next = Vec.add(
      spore.pos,
      Vec.mult(Vec.rotate(RIGHT, spore.theta), speed * dt)
    );
    if (spore.launchVel) {
      next = Vec.add(next, Vec.mult(spore.launchVel, dt));
    }
    gridCoord = screen2grid(next);
    building = getFromLayer(buildingLayer, gridCoord);
  }

  if (building !== BLDG_NONE) {
    const isDestroyed = attackBuilding(spore, dt, gridCoord, building);
    const canFeed = slimeFeedSpawnByBuilding[Math.floor(building * 0.1)];
    if (!isDestroyed && !canFeed) {
      return spore.pos;
    }
  }
  return clampToCanvas(next);
}

function nextLaunchVel(point, dt) {
  if (!point.launchVel || Vec.magnitudeSquared(point.launchVel) < 1) {
    return null;
  }
  return Vec.mult(point.launchVel, launchAirResistance);
}

ctx.fillStyle = "black";
ctx.fillRect(0, 0, canvas.width, canvas.height);
draw();

function mouse2canvas(x, y) {
  return Vec.create(
    x - (canvas.offsetLeft - window.pageXOffset),
    y - (canvas.offsetTop - window.pageYOffset)
  );
}

function randRange(min, max) {
  return Math.random() * (max - min) + min;
}

function clamp(val, min, max) {
  return Math.max(min, Math.min(max, val));
}

function clampToCanvas(point) {
  return Vec.create(
    clamp(point.x, 0, canvas.width),
    clamp(point.y, 0, canvas.height)
  );
}

function getBaseLog(base, num) {
  return Math.log(num) / Math.log(base);
}



// put any images to preload here so they don't be invisible on first use
function loadImages() {
  return {
    boom: loadImg("img/boom.png"),
    wall: loadImg("img/wall.png"),
    wall_dmg: loadImg("img/wall_dmg.png"),
    plant: loadImg("img/plant.png"),
    plant_dmg: loadImg("img/plant_dmg.png"),
    ovum: loadImg("img/ovum.png"),
    ovum_dmg: loadImg("img/ovum_dmg.png"),
  }
}

function loadImg(src) {
  const img = new Image();
  img.src = src;
  return img;
}