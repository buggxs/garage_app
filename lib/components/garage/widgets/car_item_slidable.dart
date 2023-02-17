import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CarItemSlidable extends StatelessWidget {
  const CarItemSlidable({
    Key? key,
    required this.child,
    this.onDelete,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: <SlidableAction>[
            SlidableAction(
              onPressed: (BuildContext context) => onDelete?.call(),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.share,
              label: 'Share',
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
