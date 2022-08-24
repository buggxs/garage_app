import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  InfoCard({
    Key? key,
    this.icon,
    this.text,
  }) : super(key: key);

  Icon? icon;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 16.0),
                  child: Text(
                    text ?? "Alle Fahrzeuge einwandfrei",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 16.0),
                  child: icon ??
                      const Icon(
                        Icons.check,
                        color: Colors.greenAccent,
                        size: 32,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }
}
