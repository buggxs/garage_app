import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garage_app/api/car/data/car.dart';
import 'package:garage_app/api/document/data/document.dart';
import 'package:garage_app/components/car/cubit/car_cubit.dart';
import 'package:garage_app/components/car/documents/cubit/document_cubit.dart';
import 'package:garage_app/components/car/documents/widgets/document_screen.dart';
import 'package:garage_app/components/car/i18n/car_i18n.dart';
import 'package:garage_app/components/car/i18n/car_text.dart';

class DocumentTab extends StatelessWidget {
  const DocumentTab({
    Key? key,
    this.car,
  }) : super(key: key);

  final Car? car;

  @override
  Widget build(BuildContext context) {
    CarCubit cubit = context.watch<CarCubit>();

    return BlocProvider(
      create: (context) => DocumentCubit(
        car: cubit.car,
        carCubit: cubit,
      )..loadDocuments(),
      child: const DocumentTabContent(),
    );
  }
}

class DocumentTabContent extends StatelessWidget {
  const DocumentTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DocumentCubit cubit = context.watch<DocumentCubit>();
    DocumentState state = cubit.state;

    Widget? child;

    if (state is DocumentLoadingState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is DocumentLoadedState) {
      child = SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _documentList(context, state.documentList),
      );
    } else {
      child = Center(
        child: Text(CarText.errorLoadingDocuments()),
      );
    }
    return child;
  }

  Widget _documentList(
    BuildContext context,
    List<List<Document>>? documentList,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._generalDocumentBlock(documentList),
        ..._invoiceDocumentBlock(documentList),
        ..._otherDocumentBlock(documentList),
      ],
    );
  }

  List<Widget> _generalDocumentBlock(List<List<Document>>? documentList) {
    return <Widget>[
      Text(
        CarText.generalDocumentsHeading(),
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 25.0),
        child: _listingDocuments(documentList?[0] ?? []),
      ),
    ];
  }

  List<Widget> _invoiceDocumentBlock(List<List<Document>>? documentList) {
    return <Widget>[
      Text(
        CarText.invoiceDocumentsHeading(),
        style: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 25.0),
        child: _listingDocuments(documentList?[1] ?? []),
      ),
    ];
  }

  List<Widget> _otherDocumentBlock(List<List<Document>>? documentList) {
    return <Widget>[
      Text(
        CarText.otherDocumentsHeading(),
        style: const TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 25.0),
        child: _listingDocuments(documentList?[2] ?? []),
      ),
    ];
  }

  Widget _listingDocuments(List<Document> documents) {
    return ListView.separated(
      itemBuilder: (context, index) => _listTile(
        text: documents[index].name,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DocumentScreen(
              document: documents[index],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => _divider(),
      itemCount: documents.length,
      shrinkWrap: true,
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
        decoration: const BoxDecoration(color: Colors.white),
      ),
    );
  }
}
