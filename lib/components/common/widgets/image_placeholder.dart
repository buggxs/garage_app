import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key? key,
    this.fit,
    this.imageUrl,
  }) : super(key: key);

  final BoxFit? fit;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? FadeInImage.assetNetwork(
            fit: fit ?? BoxFit.cover,
            placeholder: 'assets/img/car-placeholder.png',
            image: imageUrl!,
          )
        : const Image(
            image: AssetImage('assets/img/car-placeholder.png'),
          );
  }
}
