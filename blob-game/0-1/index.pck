GDPC                                                                               @   res://.import/blob-0.png-ec06f1cba868bd107cc30f188d6b080b.stex  �/      �      �7�;�p;��IW���@   res://.import/blob-1.png-40ac8909811993fc2b4a8dc534f0bdc6.stex  p4      �      l<��ݵ$B��J�9�@   res://.import/blob-2.png-125a8ed5b013988a6ce5cc32cc8a2325.stex  9      �      Y�/��=}`�ȏ;����   res://End.tscn  �      �	      ���m��W�E2���   res://FadingLabel.gd.remap  0J      &       S+Y�t����v<�}�   res://FadingLabel.gdc   �      8      }�[J���( ��   res://Main Scene.tscn   �      �      ��j2��`r��E�   res://blob/Blob.gd.remap`J      $       �#��'�%;	8}]��   res://blob/Blob.gdc �$      �      ��փ�^�/�N��v=   res://blob/Blob.tscn�+      �      �����|�J�Px:   res://blob/blob-0.png.import�1      �      &��Sq7�9�㊺=��   res://blob/blob-1.png.import`6      �      �+o�A&�qkI�J/��   res://blob/blob-2.png.import ;      �      ELR	�����ۊC+   res://credits.txt   �=      Z       ���L��s���˖@�'   res://icon.png  K      �      G1?��z�c��vN��   res://project.binary X      h      �/�P�A���x�(   res://tutorial/LaunchMessage.gd.remap   �J      1       $g��[h�S�S7N��    res://tutorial/LaunchMessage.gdc>      �      �k��d��@9���   res://tutorial/Tutorial.tscn�@      Z      �ʕ�e���a��7�>�(   res://tutorial/VelocityMessage.gd.remap �J      3       E���#��-X�Z�%$   res://tutorial/VelocityMessage.gdc  @E      �      �""���>�h���k��            [gd_scene load_steps=17 format=2]

[sub_resource type="CanvasItemMaterial" id=1]
blend_mode = 1
particles_animation = true
particles_anim_h_frames = 1
particles_anim_v_frames = 1
particles_anim_loop = false

[sub_resource type="Curve" id=2]
min_value = -360.0
max_value = 360.0
_data = [ Vector2( 0, -194.627 ), 0.0, 0.0, 0, 0, Vector2( 0.990215, 178.346 ), 0.0, 0.0, 0, 0 ]

[sub_resource type="CurveTexture" id=3]
curve = SubResource( 2 )

[sub_resource type="Gradient" id=4]
offsets = PoolRealArray( 0, 0.362851, 1 )
colors = PoolColorArray( 0, 0, 0, 1, 0.671582, 0.309233, 0.794931, 1, 1, 1, 1, 1 )

[sub_resource type="GradientTexture" id=5]
gradient = SubResource( 4 )

[sub_resource type="Curve" id=6]
min_value = -1.0
_data = [ Vector2( 0, -0.573491 ), 0.0, 0.0, 0, 0, Vector2( 1, 0.723807 ), 0.0, 0.0, 0, 0 ]

[sub_resource type="CurveTexture" id=7]
curve = SubResource( 6 )

[sub_resource type="Curve" id=8]
min_value = -500.0
max_value = 500.0
_data = [ Vector2( 0, -500 ), 0.0, 0.0, 0, 0, Vector2( 1, 500 ), 0.0, 0.0, 0, 0 ]

[sub_resource type="CurveTexture" id=9]
curve = SubResource( 8 )

[sub_resource type="Gradient" id=10]

[sub_resource type="GradientTexture" id=11]
gradient = SubResource( 10 )

[sub_resource type="Curve" id=12]
_data = [ Vector2( 0, 0 ), 0.0, 0.0, 0, 0, Vector2( 1, 1 ), 0.0, 0.0, 0, 0 ]

[sub_resource type="CurveTexture" id=13]
curve = SubResource( 12 )

[sub_resource type="ParticlesMaterial" id=14]
lifetime_randomness = 1.0
trail_divisor = 215
trail_size_modifier = SubResource( 13 )
trail_color_modifier = SubResource( 11 )
emission_shape = 1
emission_sphere_radius = 1.0
flag_disable_z = true
spread = 180.0
gravity = Vector3( 0, 98, 0 )
initial_velocity = 11.58
initial_velocity_random = 1.0
angular_velocity = 20.76
angular_velocity_random = 1.0
angular_velocity_curve = SubResource( 3 )
orbit_velocity = 28.96
orbit_velocity_random = 1.0
orbit_velocity_curve = SubResource( 9 )
linear_accel = 100.0
linear_accel_random = 1.0
tangential_accel = 100.0
tangential_accel_random = 1.0
angle = 5.0
angle_random = 1.0
color_ramp = SubResource( 5 )
hue_variation = 0.1
hue_variation_random = 1.0
hue_variation_curve = SubResource( 7 )
anim_speed = 128.0
anim_speed_random = 1.0

[sub_resource type="OpenSimplexNoise" id=15]

[sub_resource type="NoiseTexture" id=16]
noise = SubResource( 15 )

[node name="End" type="Particles2D"]
material = SubResource( 1 )
amount = 800
process_material = SubResource( 14 )
texture = SubResource( 16 )
   GDSC      	   .        ������������ڶ��   �����������������Ŷ�   ��������������¶   ����������۶   ��������ٶ��   �������ض���   �������Ӷ���   ׶��   ��������Ѷ��   ����   �嶶   �������������ն�   ���Ӷ���   ���۶���   �ٶ�   ����������������Ŷ��   ������ض   �������¶���   �������Ŷ���   �����׶�   �������Ŷ���     �?                zD      fading                               done fading                          
                           	      
         "      +      ,      -      3      8      9      :      @      K      L      M      ^      j      n      r      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   3YYY8;�  YY;�  �  Y;�  �  Y;�  YYY0�  PQV�  .T�  T�  �  YYY0�  PQV�  .�  �  YYY0�	  PQV�  .�
  T�  PQ<�  �  YYY0�  P�  V�  R�  V�  R�  �  QV�  �  �	  PQP�  �  Q�  �  �  �  �  �  �  �?  P�  R�  R�  R�  R�  R�  R�  R�	  PQR�  R�  QYYY0�  PQV�  �  P�  RRT�  T�  QYYY0�  PQV�  �  PR�  RT�  T�  QYYYY0�  P�  QV�  &�  �  V�  ;�  �5  PP�	  PQ�  Q�  R�  R�  Q�  T�  T�  �  P�  R�  R�  Q�  &T�  T�  �  V�  �?  P�  Q�  T�  �  Y`        [gd_scene load_steps=7 format=2]

[ext_resource path="res://blob/Blob.tscn" type="PackedScene" id=1]
[ext_resource path="res://tutorial/Tutorial.tscn" type="PackedScene" id=2]
[ext_resource path="res://End.tscn" type="PackedScene" id=3]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 576.75, 189.75 )

[sub_resource type="SegmentShape2D" id=2]
a = Vector2( -6.00081, -299.625 )
b = Vector2( -5.99865, 500 )

[sub_resource type="RectangleShape2D" id=3]
extents = Vector2( 35.5, 4 )

[node name="Main Scene" type="Node"]

[node name="Wall" type="StaticBody2D" parent="."]
position = Vector2( 531, 759 )
__meta__ = {
"_edit_group_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="Wall"]
shape = SubResource( 1 )

[node name="Line2D" type="Line2D" parent="Wall"]
points = PoolVector2Array( -573, -186, 573, -186, 573, 186, -573, 186, -573, -186 )
default_color = Color( 0.172549, 0.643137, 0.509804, 1 )
begin_cap_mode = 1
end_cap_mode = 1

[node name="Wall2" type="StaticBody2D" parent="."]
position = Vector2( 26, 421 )
rotation = -3.14159
scale = Vector2( 1, 1.068 )
__meta__ = {
"_edit_group_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="Wall2"]
shape = SubResource( 2 )

[node name="Line2D" type="Line2D" parent="Wall2"]
points = PoolVector2Array( -3, -300, -3, 500.187 )
default_color = Color( 0.172549, 0.643137, 0.509804, 1 )

[node name="Wall3" type="StaticBody2D" parent="."]
position = Vector2( 1004, 172 )
scale = Vector2( 1, 1.068 )
__meta__ = {
"_edit_group_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="Wall3"]
shape = SubResource( 2 )

[node name="Line2D" type="Line2D" parent="Wall3"]
points = PoolVector2Array( -3, -300, -3, 500.187 )
default_color = Color( 0.172549, 0.643137, 0.509804, 1 )

[node name="Wall4" type="StaticBody2D" parent="."]
position = Vector2( 140, -104 )
rotation = 4.84556
scale = Vector2( 1, 1.068 )
__meta__ = {
"_edit_group_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="Wall4"]
shape = SubResource( 2 )

[node name="Line2D" type="Line2D" parent="Wall4"]
points = PoolVector2Array( -3, -300, -3, 500.187 )
default_color = Color( 0.172549, 0.643137, 0.509804, 1 )

[node name="Wall5" type="StaticBody2D" parent="."]
position = Vector2( 675, -238 )
rotation = 4.97418
scale = Vector2( 1.06358, 1.07302 )
__meta__ = {
"_edit_group_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="Wall5"]
shape = SubResource( 2 )

[node name="Line2D" type="Line2D" parent="Wall5"]
points = PoolVector2Array( -3, -300, -3, 500.187 )
default_color = Color( 0.172549, 0.643137, 0.509804, 1 )

[node name="Tutorial" parent="." instance=ExtResource( 2 )]
position = Vector2( 499, 622 )

[node name="KeepGoing" type="RichTextLabel" parent="."]
margin_left = 437.0
margin_top = -2139.0
margin_right = 537.0
margin_bottom = -2119.0
text = "Keep going!"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="RestStop" type="RichTextLabel" parent="."]
margin_left = 474.0
margin_top = -4688.0
margin_right = 574.0
margin_bottom = -4668.0
text = "Rest stop"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="StaticBody2D" type="StaticBody2D" parent="RestStop"]

[node name="CollisionShape2D" type="CollisionShape2D" parent="RestStop/StaticBody2D"]
position = Vector2( 36.5, 7 )
shape = SubResource( 3 )

[node name="AlmostThere" type="RichTextLabel" parent="."]
margin_left = 299.0
margin_top = -8080.0
margin_right = 399.0
margin_bottom = -8060.0
text = "Almost there!"
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Blob" parent="." instance=ExtResource( 1 )]
position = Vector2( 499, 469 )

[node name="Camera2D" type="Camera2D" parent="Blob"]
current = true

[node name="End" parent="." instance=ExtResource( 3 )]
position = Vector2( 299, -10918 )
scale = Vector2( 0.5, 0.5 )

[connection signal="launched" from="Blob" to="Tutorial/LaunchMessage" method="_on_Blob_launched"]
[connection signal="launched" from="Blob" to="Tutorial/VelocityMessage" method="_on_Blob_launched"]

[editable path="Tutorial"]
    GDSC      	   H        ��������τ�   ���������������������Ķ�   ������������������϶   ������������������϶   ���������Ҷ�   ����������������Ķ��   �������Ҷ���   ����������������޶��   �����������������������Ŷ���   �������������������϶���   �����϶�   ���������������¶���   ����¶��   ��������������������ض��   �����������ζ���   �����������   ���������Ҷ�   �������ض���   ������������������������ض��   ���������¶�   �����޶�   ��������Ӷ��   �����޶�   ���������Ҷ�   ��������������϶   ����������ڶ         �     �      d         ?                       launched                                                    	      
          (      )      1      2      5      6      7      <      A      F      G      H      I      O      Q      R      S      T      U      V      W       X   !   _   "   l   #   n   $   o   %   w   &   x   '   y   (      )   �   *   �   +   �   ,   �   -   �   .   �   /   �   0   �   1   �   2   �   3   �   4   �   5   �   6   �   7   �   8   �   9   �   :   �   ;      <     =     >     ?     @     A     B     C     D   	  E   
  F     G     H   3YYYY8;�  V�  YY8;�  V�  �  YY8;�  V�  �  YY8;�  V�  �  YY8;�  V�  �  YYB�  YYY;�  �  Y;�  �  Y;�	  �  YYYY0�
  PQV�  -YYYYYYYY0�  P�  QV�  &�  4�  �  T�  �  V�  .�  �  &�  T�  PQV�  �  �  �  �  T�  �  �	  �  PQT�  �  �  �  �  �  &�  T�  PQ�  V�  �  �  ;�  P�  T�  �  Q�  �  ;�  P�	  �  Q�  �  ;�  �  T�  PQ�  �  �  �  T�  PQ�  �  &�  T�  PQ�  V�  �  �  T�  PQ�  �  &�  T�  PQ�  V�  T�  �  �  �  P�  R�  Q�  �  �  �  �	  �  �  �  �  YYYYYYYYYYYYYY`            [gd_scene load_steps=8 format=2]

[ext_resource path="res://blob/blob-1.png" type="Texture" id=1]
[ext_resource path="res://blob/blob-0.png" type="Texture" id=2]
[ext_resource path="res://blob/blob-2.png" type="Texture" id=3]
[ext_resource path="res://blob/Blob.gd" type="Script" id=4]

[sub_resource type="PhysicsMaterial" id=3]
bounce = 0.3

[sub_resource type="SpriteFrames" id=1]
animations = [ {
"frames": [ ExtResource( 2 ), ExtResource( 2 ), ExtResource( 1 ), ExtResource( 3 ), ExtResource( 3 ), ExtResource( 1 ) ],
"loop": true,
"name": "default",
"speed": 2.0
} ]

[sub_resource type="CircleShape2D" id=2]
radius = 31.0

[node name="Blob" type="RigidBody2D"]
physics_material_override = SubResource( 3 )
continuous_cd = 2
script = ExtResource( 4 )
launch_velocity_factor = 2.0
max_launch_velocity = 1000.0

[node name="AnimatedSprite" type="AnimatedSprite" parent="."]
frames = SubResource( 1 )
frame = 1
playing = true

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 2 )
   GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?�?��m#���?�u�9
"٠�ObIe��^��.  (�� ����wj�l%��v܆�%پ����-������������D���۶q��w|d�<�9L4	���ٱ��;~�b��9p��r���K�
w��xś�[�w��Au[�"�>\��v��{���Ů��E�T޶�9�*"wDz�\��/:��R�fE���i�k����%kլz��+v�Zr�敼�E���ZoZ�/��8��f-U9#zjn��9��q|jn�e!�E^J�h��Ő��+Ť�����ڦ����p�8w`�Ng���S�g�b\z��Y����O/��8F��(�?��4�16c�F#����0�e{1�f����t�C�4���4����>C��o��]o����	��E�6t7��v�+&g/,�;�]l�#�l [remap]

importer="texture"
type="StreamTexture"
path="res://.import/blob-0.png-ec06f1cba868bd107cc30f188d6b080b.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://blob/blob-0.png"
dest_files=[ "res://.import/blob-0.png-ec06f1cba868bd107cc30f188d6b080b.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
   GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?�?��m#���?�u�9
"٠�ObIe��^��.  (�� ����wj�l%��v��{�[ʀL@Z��A��u}���������Cp�F��$P\U��7����ƁVDT��0�T���̓���Ƚ��-k7m*��Q���|]���4D���Z��|5vss�\�{�m;��e&�mDr9��-�M�T��^��N>R֢Ld&Ead�,6�x�"�bY��D#��g�\4��0��GN9'-�՘=�IS*YW#>
t��zD$k}|fO&µ���&�Am�ԇ5@��/YL)g�݇�%�h>{�"(4��@fn�����}M-X��I������^�_`�zi,}�FWF�#�s��z�u��{2Ʈ|��8�:<x���m3d��������<
� ��6h�ŚΊ������셍�f͗Ȇ�g      [remap]

importer="texture"
type="StreamTexture"
path="res://.import/blob-1.png-40ac8909811993fc2b4a8dc534f0bdc6.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://blob/blob-1.png"
dest_files=[ "res://.import/blob-1.png-40ac8909811993fc2b4a8dc534f0bdc6.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
   GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?�?��m#���?�u�9
"٠�ObIe��^��.  (�� ����wj�l%��v܆�
�ڜk�ـL0�B��#��������;p�6���;3{�b���j7ЊH��X&�j���i��}���e�↡M�36
�x���k�w�f����	�+�Z���dn/�˝��p�<۶���l��v�6")�"W"nIYK�B�y�Y�:��?lRIb���jIZ4���b#�aSr*g�.��9����YT�梞՘8%�Ngd6B�M�q�z�q�<�d������RÍ1�	Ҝs�H}�D�3<hO2��f�)A3��d&
S��B)�}�^nk�������^�_`��X�X����G���;녮+�ь�'c�����P��/o�܃���v;�{��jg�Dw4�bMgE{�j��Bt��ƂA��KdÎxѳ [remap]

importer="texture"
type="StreamTexture"
path="res://.import/blob-2.png-125a8ed5b013988a6ce5cc32cc8a2325.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://blob/blob-2.png"
dest_files=[ "res://.import/blob-2.png-125a8ed5b013988a6ce5cc32cc8a2325.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
   Christy, for believing in me and for her wonderful user testing and endless encouragement
      GDSC            Z      ��������Ŷ��   �������Ҷ���   �����϶�   �������Ӷ���   �����������Ķ���   ������ض   ����������������Ҷ��   ������޶   �������¶���   �������Ӷ���   ���������¶�      res://FadingLabel.gd     �?             timeout             /root/Main Scene/Blob         launched      _on_Blob_launched                            
                           	      
         '      ,      2      3      4      5      6      7      8      9      @      F      J      X      3YYY8;�  YYY;�  �  YYY0�  PQV�  AP�  PQT�  PQR�  Q�  &�  V�  T�  PQYYYYYYYY0�  P�  QV�  T�  PQ�  �  �  �  �	  P�  QT�
  P�  RR�  QY`           [gd_scene load_steps=3 format=2]

[ext_resource path="res://tutorial/LaunchMessage.gd" type="Script" id=1]
[ext_resource path="res://tutorial/VelocityMessage.gd" type="Script" id=2]

[node name="Tutorial" type="Node2D"]

[node name="LaunchMessage" type="RichTextLabel" parent="."]
modulate = Color( 1, 1, 1, 0 )
margin_left = -200.0
margin_top = -10.0
margin_right = 200.0
margin_bottom = 10.0
rect_pivot_offset = Vector2( 200, 20 )
bbcode_enabled = true
bbcode_text = "[center]Click anywhere to fling yourself.[/center]"
text = "Click anywhere to fling yourself."
script = ExtResource( 1 )
__meta__ = {
"_edit_use_anchors_": true
}
wait_secs = 5.0

[node name="VelocityMessage" type="RichTextLabel" parent="."]
modulate = Color( 1, 1, 1, 0 )
margin_left = -200.0
margin_top = -10.0
margin_right = 200.0
margin_bottom = 10.0
rect_pivot_offset = Vector2( 200, 20 )
bbcode_enabled = true
bbcode_text = "[center]The farther away you click, the farther you jump.[/center]"
text = "The farther away you click, the farther you jump."
script = ExtResource( 2 )
__meta__ = {
"_edit_use_anchors_": true
}
diff_test = 300.0
      GDSC      
   )   �      ��������¶��   ��������Ŷ��   ���������������Ŷ���   �������¶���   ��������������޶   �������������޶�   �����϶�   ����������������Ҷ��   �����޶�   �������϶���   �����޶�   ����   �������Ӷ���   �����������Ķ���   ������ض   �������Ӷ���   ���������¶�   �������������Ŷ�   �������¶���      res://FadingLabel.gd     HC      @     �@                 timeout       /root/Main Scene/Blob         launched      _on_Blob_launched                            
                           	      
   "      '      (      )      *      0      2      3      4      ;      D      E      N      W      X      Y      _      e      f      j      n      |       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   3YYY8;�  Y8;�  �  Y8;�  �  YYY;�  �  Y;�  ]Y;�  �  YYYY0�  PQV�  -YYY0�  P�  QV�  ;�	  �  T�
  PQ�  �  �  �4  P�	  R�  Q�  �  �3  P�	  R�  Q�  �  �  &�  �  V�  �  �  PQ�  �  �  �	  �  �  �	  �  AP�  PQT�  P�  QR�  Q�  T�  PQY�  &�  �  �  �  V�  �  �  P�  QT�  P�  RR�	  Q�  ;�  �5  P�  P�  PQ�  QR�  R�  Q�  AP�  PQT�  P�  QR�  Q�  T�  PQ�  Y`      [remap]

path="res://FadingLabel.gdc"
          [remap]

path="res://blob/Blob.gdc"
            [remap]

path="res://tutorial/LaunchMessage.gdc"
               [remap]

path="res://tutorial/VelocityMessage.gdc"
             �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name      	   Blob Game      application/run/main_scene          res://Main Scene.tscn      application/config/icon         res://icon.png  )   physics/common/enable_pause_aware_picking            physics/2d/default_gravity      �  )   rendering/environment/default_environment          res://default_env.tres          