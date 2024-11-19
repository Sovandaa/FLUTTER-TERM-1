import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6-S2/EXERCISE-2/model/profile_tile_model.dart';

ProfileData myProfile = ProfileData(
    name: "Sovanda",
    position: "Flutter Developer",
    avatarUrl: 'assets/W6-S2/woman.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(
          icon: Icons.email, title: "Mail", value: "sovanda.ban@student.cadt.edu.kh"),
      TileData(
          icon: Icons.person, title: "Full Name", value: "Ban Sovanda"),
      TileData(
          icon: Icons.school, title: "Major", value: "Software Engineering"),
      TileData(
          icon: Icons.home, title: "HomeTown", value: "Kandal")
    ]);
