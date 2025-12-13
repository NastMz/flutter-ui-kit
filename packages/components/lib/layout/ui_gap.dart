import 'package:flutter/material.dart';

/// A replacement for [SizedBox] when adding spacing between widgets.
///
/// It consumes space in both directions, making it safe to use in
/// both [Row] and [Column].
class UiGap extends StatelessWidget {
  final double size;

  const UiGap(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size, height: size);
  }
}
