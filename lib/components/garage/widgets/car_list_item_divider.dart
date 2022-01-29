import 'package:flutter/material.dart';

class CarListItemDivider extends StatelessWidget {
  const CarListItemDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                height: 10,
                color: Colors.white,
                child: Text("")
            ),
          ),
          Container(
              height: 30,
              width: 10,
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              color: Colors.white,
              child: Text("")
          ),
        ],
      ),
    );
  }
}
