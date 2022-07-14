import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/components/common/widgets/image_placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
    this.urlList,
    this.carouselOptions,
    this.withIndicator = false,
    this.activeIndex = 0,
    this.onDotClicked,
    this.carouselController,
  }) : super(key: key);

  final List<String>? urlList;
  final CarouselOptions? carouselOptions;
  final bool withIndicator;
  final int activeIndex;
  final Function(int? index)? onDotClicked;
  final CarouselController? carouselController;

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
        child = _buildCarouselSlider(
          urlList!,
          carouselOptions: carouselOptions,
        );
      }
    }
    return child;
  }

  Widget _buildCarouselSlider(
    List<String> urlList, {
    CarouselOptions? carouselOptions,
  }) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: carouselOptions ??
              CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
              ),
          itemBuilder: (context, index, realIndex) => ImagePlaceholder(
            imageUrl: urlList[index],
            fit: BoxFit.cover,
          ),
          itemCount: urlList.length,
        ),
        const SizedBox(
          height: 8,
        ),
        withIndicator
            ? AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: urlList.length,
                effect: const ExpandingDotsEffect(
                  dotWidth: 20,
                  dotHeight: 20,
                ),
                onDotClicked: onDotClicked,
              )
            : const SizedBox(),
      ],
    );
  }
}
