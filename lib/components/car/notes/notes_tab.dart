import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/components/car/properties/widget/property_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotesTab extends StatelessWidget {
  const NotesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text("Notizen", style: TextStyle(color: Colors.white),)
      )
    );
  }
}
