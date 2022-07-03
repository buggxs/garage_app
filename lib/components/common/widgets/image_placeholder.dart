import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key? key,
    this.fit,
    this.image,
  }) : super(key: key);

  final BoxFit? fit;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: fit ?? BoxFit.cover,
      placeholder: const AssetImage('assets/img/car-placeholder.png'),
      image: image ?? const AssetImage('assets/img/car-placeholder.png'),
    );
  }
}
