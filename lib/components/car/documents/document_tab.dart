import 'package:flutter/material.dart';
import 'package:garage_app/components/car/documents/widgets/document_screen.dart';
import 'package:garage_app/core/app_localizations.dart';

class DocumentTab extends StatelessWidget {
  const DocumentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!
                .translate('general_documents_heading')!,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _listTile(
                  text: 'Fahrzeugschein',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentScreen(),
                    ),
                  ),
                ),
                _divider(),
                _listTile(
                  text: 'Fahrzeugbrief',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentScreen(),
                    ),
                  ),
                ),
                _divider(),
                _listTile(
                  text: 'Kaufvertrag',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            AppLocalizations.of(context)!
                .translate('invoice_documents_heading')!,
            style: const TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _listTile(
                  text: 'Auspuff ausgetauscht',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentScreen(),
                    ),
                  ),
                ),
                _divider(),
                _listTile(
                  text: 'Zahnriemenwechsel',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentScreen(),
                    ),
                  ),
                ),
                _divider(),
                _listTile(
                  text: 'Ölwechsel',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DocumentScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTile({String? text, Function()? onTap}) {
    return Builder(builder: (context) {
      return InkWell(
        child: Row(
          children: [
            Text(
              text ?? 'Unknown',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onTap: onTap,
      );
    });
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 3,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
