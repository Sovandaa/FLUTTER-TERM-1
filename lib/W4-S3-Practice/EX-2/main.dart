import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(),
            FavoriteCard(),
            FavoriteCard(),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

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
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.0),
                Text('description')
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
                // color: Colors.red,
              ))
        ],
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text("Favorit cards"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Expanded(
//               child: Column(
//                 children: [
//                   Text("title", style: TextStyle(color: Colors.blue),),
//                   Text("description"),
//                 ],
//               )),
//             IconButton(
//               onPressed: () => {}, 
//               color: Colors.red,
//               icon: const Icon(Icons.favorite),

//               ),
//           ],
//         ),
//       ),
//     ),
//   ));
// }
