import 'package:flutter/material.dart';
import 'package:flutter_workspace/W6-S2/EXERCISE-4/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: const FavoriteJokes(),
      ),
    ));

class FavoriteJokes extends StatefulWidget {
  const FavoriteJokes({super.key});

  @override
  State<FavoriteJokes> createState() => _FavoriteJokesState();
}

class _FavoriteJokesState extends State<FavoriteJokes> {
  int? favIndex; // keep track current fav joke (null, not selected)

  // set/remove fav joke (only one fav joke selected)
  void setFavorite(int index) {
    setState(() {
      if (favIndex == index) {
        favIndex = null;  // remove favorite if the same joke is clicked
      } else {
        favIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < 20; i++)
          FavoriteCard(
            title: jokes[i].title,
            description: jokes[i].description,
            isFavorite: favIndex == i, // check fav joke
            onFavoriteClick: () => setFavorite(i), // Update favorite click
          ),
      ],
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(description)
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick, //call when btn pressed
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
