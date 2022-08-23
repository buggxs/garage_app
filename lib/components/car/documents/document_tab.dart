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
    final CarCubit cubit = context.watch<CarCubit>();

    return BlocProvider<DocumentCubit>(
      create: (_) => DocumentCubit(
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
    final DocumentCubit cubit = context.watch<DocumentCubit>();
    final DocumentState state = cubit.state;

    Widget? child;

    if (state is DocumentLoadingState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is DocumentLoadedState) {
      child = SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
      children: <Widget>[
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
        padding: const EdgeInsets.only(top: 12, bottom: 25),
        child: _listingDocuments(documentList?[0] ?? <Document>[]),
      ),
    ];
  }

  List<Widget> _invoiceDocumentBlock(List<List<Document>>? documentList) {
    return <Widget>[
      Text(
        CarText.invoiceDocumentsHeading(),
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 25),
        child: _listingDocuments(documentList?[1] ?? <Document>[]),
      ),
    ];
  }

  List<Widget> _otherDocumentBlock(List<List<Document>>? documentList) {
    return <Widget>[
      Text(
        CarText.otherDocumentsHeading(),
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 25),
        child: _listingDocuments(documentList?[2] ?? <Document>[]),
      ),
    ];
  }

  Widget _listingDocuments(List<Document> documents) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => _listTile(
        text: documents[index].name,
        onTap: () => Navigator.push<Route<MaterialPageRoute<dynamic>>>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DocumentScreen(
              document: documents[index],
            ),
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => _divider(),
      itemCount: documents.length,
      shrinkWrap: true,
    );
  }

  Widget _listTile({String? text, Function()? onTap}) {
    return Builder(
      builder: (BuildContext context) {
        return InkWell(
          onTap: onTap,
          child: Row(
            children: <Widget>[
              Text(
                text ?? 'Unknown',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        height: 3,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
      ),
    );
  }
}
