import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6-S2/EXERCISE-2/data/profile_data.dart';
import 'package:flutter_workspace/W6-S2/EXERCISE-2/model/profile_tile_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(myProfile: myProfile),
  ));
}

const Color mainColor = Color(0xff1d2f43);

class ProfileApp extends StatelessWidget {
  // const ProfileApp({super.key});

  final ProfileData myProfile;

  const ProfileApp({super.key, required this.myProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(200),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT Student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(myProfile.avatarUrl),
              ),
              const SizedBox(height: 20),
              Text(
                myProfile.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              Text(
                myProfile.position,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ...myProfile.tiles.map((tile) => ProfileTile(
                  icon: tile.icon, title: tile.title, data: tile.value)),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
