import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGalleryScaffold(),
    ));

class ImageGalleryScaffold extends StatefulWidget {
  const ImageGalleryScaffold({
    super.key,
  });

  @override
  State<ImageGalleryScaffold> createState() => _ImageGalleryScaffoldState();
}

class _ImageGalleryScaffoldState extends State<ImageGalleryScaffold> {
  List<String> images = [
    "assets/w4-s2/bird.jpg",
    "assets/w4-s2/bird2.jpg",
    "assets/w4-s2/insect.jpg",
    "assets/w4-s2/girl.jpg",
    "assets/w4-s2/man.jpg",
  ];

  int currentIndex = 0;

  void onPrevious() {
    int newIndex = (currentIndex == 0) ? images.length - 1 : currentIndex - 1;
    setState(() => currentIndex = newIndex);
  }

  void onNext() {
    int newIndex = (currentIndex == images.length - 1) ? 0 : currentIndex + 1;
    setState(() => currentIndex = newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: onPrevious,
          ),
          IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: onNext,
            ),
        ],
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}
