import 'package:flutter/material.dart';

class ParkingFloatingButton extends StatelessWidget {
  const ParkingFloatingButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.blueAccent, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
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
              color: Colors.blueAccent,
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
