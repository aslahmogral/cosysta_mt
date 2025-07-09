import 'package:flutter/material.dart';

class SideBySide extends StatelessWidget {
  final Widget firstChild;
  final Widget secondChild;

  const SideBySide({super.key, required this.firstChild, required this.secondChild});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: firstChild),
        SizedBox(width: 12),
        Expanded(child: secondChild),
      ],
    );
  }
}

