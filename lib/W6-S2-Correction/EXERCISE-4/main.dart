import 'package:flutter/material.dart';
import 'data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: JokeList(
          jokes: allJokes,
        ),
      ),
    ));

class JokeList extends StatefulWidget {
  const JokeList({super.key, required this.jokes});

  final List<Joke> jokes;

  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  Joke? favoriteJoke; // if null, no joke are yet selected as favorite

  void onFavoriteSelected(Joke joke) {
    setState(() {
      favoriteJoke = joke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...widget.jokes.map((joke) => JokeCard(
              joke: joke,
              isFavorite: (joke == favoriteJoke),
              onFavoriteSelected:onFavoriteSelected,
            ))
      ],
    );
  }
}

class JokeCard extends StatelessWidget {
  const JokeCard(
      {super.key,
      required this.joke,
      required this.isFavorite,
      required this.onFavoriteSelected});

  final Joke joke;
  final bool isFavorite;
  final void Function(Joke) onFavoriteSelected;

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
                  'title',
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                const Text('description')
              ],
            ),
          ),
          IconButton(
              onPressed: () => onFavoriteSelected(joke),
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
