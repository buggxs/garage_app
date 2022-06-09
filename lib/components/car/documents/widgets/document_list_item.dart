import 'package:flutter/material.dart';

class DocumentListItem extends StatelessWidget {
  const DocumentListItem({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  final String? text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
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
  }
}
