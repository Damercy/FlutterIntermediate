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
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(imageList[index].url,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                }),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  imageList[index].title,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ));
        });
  }
}
