
// what type of data will store the jokes? List object (class joke)
// what type of data will store the favorite joke? (int?)
// which widget should be in charge of storing the favorite joke? main widget (favoriteCard)
// Which widget should be stateful? (favoriteJoke as stateful)
// How will your widget interact?
// Do you need to pass callback function between widgets? (yes, when btn is pressed to select fav joke -> for update state)

class Joke {
  final String title;
  final String description;

  Joke({
    required this.title,
    required this.description,
  });
  // list of 20 jokes
  List<Joke> jokes = List.generate(
    20,
    (index) => Joke(title: "Title", description: "description"),
  );
}
