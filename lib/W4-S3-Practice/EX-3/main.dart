import 'package:flutter/material.dart';

List<String> images = [
  "assets/W4-S3/bird.jpg",
  "assets/W4-S3/bird2.jpg",
  "assets/W4-S3/insect.jpg",
  "assets/W4-S3/girl.jpg",
  "assets/W4-S3/man.jpg",
];

void main() => runApp(const ImageViewer());

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int imageIndex = 0;

  void NextImage() {
    setState(() {
      imageIndex = (imageIndex + 1) % images.length;
    });
  }

  void BackImage() {
    setState(() {
      imageIndex = (imageIndex - 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: NextImage,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: BackImage,
              ),
            ),
          ],
        ),
        body: Image.asset(images[imageIndex]),
      ),
    );
  }
}
