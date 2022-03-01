import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/components/car/properties/widget/property_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DocumentTab extends StatelessWidget {
  const DocumentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Widget> items = [
      Text("Test1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      Text("Test2", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      Text("Test3", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      Text("Test4", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      Text("Test5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      Text("Test6", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.general_documents_heading,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 22.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Fahrzeugschein",
                      style: TextStyle(
                        color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Container(
                      height: 3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Fahrzeugbrief",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Container(
                      height: 3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Kaufvertrag",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    width: double.infinity,
                  ),
                ],
              )
            ),
          ),
          Text(
            AppLocalizations.of(context)!.invoice_documents_heading,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 22.0),
            child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Auspuff ausgetauscht",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        height: 3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Zahnriemenwechsel",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        height: 3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Ölwechsel",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      width: double.infinity,
                    ),
                  ],
                )
            ),
          )
        ],
      )
    );
  }
}
