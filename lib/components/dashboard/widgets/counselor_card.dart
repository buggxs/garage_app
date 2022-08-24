import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';

class CounselorCard extends StatelessWidget {
  const CounselorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("So wechselst du dein Öl!",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            FadeInImage(
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/img/car-placeholder.png'),
              image: CacheImage(
                  'https://www.autoscout24.de/cms-content-assets/5R3jQP1wx0YlomLevlbMqU-862feed426b00d62f5876e8adc3d1810-All_no_engine_oil_change_-_konsequences_-1100.jpg'),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut [...]',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.normal),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
