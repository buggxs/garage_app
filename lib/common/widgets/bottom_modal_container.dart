import 'package:flutter/material.dart';

class BottomModalContainer extends StatelessWidget {
  const BottomModalContainer({
    Key? key,
    required this.children,
    this.title,
    this.icon,
    this.decoration,
    this.titleStyle,
  }) : super(key: key);

  final Widget? icon;
  final List<Widget> children;
  final BoxDecoration? decoration;
  final String? title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: icon,
                  ),
                  Text(
                    title ?? '',
                    style: titleStyle ?? Theme.of(context).textTheme.headline1,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Icon(
                        Icons.close,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
