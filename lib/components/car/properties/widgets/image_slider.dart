import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/components/common/widgets/image_placeholder.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
    this.urlList,
  }) : super(key: key);

  final List<String>? urlList;

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      color: Colors.grey.shade700,
      child: const Center(
        child: ImagePlaceholder(),
      ),
    );

    if (urlList?.isNotEmpty ?? false) {
      if (urlList!.length == 1) {
        child = ImagePlaceholder(imageUrl: urlList!.first);
      } else {
        child = _buildCarouselSlider(urlList!);
      }
    }
    return child;
  }

  Widget _buildCarouselSlider(List<String> urlList) {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          viewportFraction: 1.0),
      items: urlList.map((imageUrl) {
        return ImagePlaceholder(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }
}
