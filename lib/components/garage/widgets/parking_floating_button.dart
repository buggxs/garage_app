import 'package:flutter/material.dart';
import 'package:garage_app/misc/color_constants.dart';

class ParkingFloatingButton extends StatelessWidget {
  const ParkingFloatingButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final ValueChanged<BuildContext> onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.shieldBlue,
          border: Border.all(color: ColorConstants.shieldBlue, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: ColorConstants.shieldBlue,
              border: Border.all(color: Colors.white, width: 5.0),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
            child: Text(
              "P",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
