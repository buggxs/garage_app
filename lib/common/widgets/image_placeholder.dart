import 'dart:io';

import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key? key,
    this.fit,
    this.imageUrl,
  }) : super(key: key);

  final BoxFit? fit;
  final String? imageUrl;

  bool get isLocalImage =>
      (imageUrl?.startsWith('file:///') ?? false) ||
      (imageUrl?.startsWith('/data/') ?? false);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? isLocalImage
            ? FadeInImage(
                fit: fit ?? BoxFit.cover,
                placeholder: const AssetImage('assets/img/car-placeholder.png'),
                image: Image.file(File(imageUrl!)).image,
              )
            : FadeInImage.assetNetwork(
                fit: fit ?? BoxFit.cover,
                placeholder: 'assets/img/car-placeholder.png',
                image: imageUrl!,
              )
        : const Image(
            image: AssetImage('assets/img/car-placeholder.png'),
          );
  }
}
