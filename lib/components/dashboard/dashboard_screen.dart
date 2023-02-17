import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_app/common/widgets/garage_scaffold.dart';
import 'package:garage_app/components/dashboard/widgets/counselor_card.dart';
import 'package:garage_app/components/dashboard/widgets/heading_text.dart';
import 'package:garage_app/components/dashboard/widgets/info_card.dart';
import 'package:garage_app/components/dashboard/widgets/point_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GarageScaffold(
      title: 'Dashboard',
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeadingText(),
              InfoCard(),
              InfoCard(),
              InfoCard(),
              HeadingText(
                text: 'Ratgeber',
              ),
              const CounselorCard(),
              HeadingText(
                text: 'Sammle Garagenpoints',
              ),
              const PointCard(),
            ],
          ),
        ),
      ),
    );
  }
}
