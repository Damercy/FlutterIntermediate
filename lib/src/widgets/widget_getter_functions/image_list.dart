import 'package:UdemyFlutter/src/models/image_model.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  // Thus stateless widgets can have instance variables but they must be final
  final List<ImageModel> imageList;

  ImageList(this.imageList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Image.network(imageList[index].url)
          );
        });
  }
}
