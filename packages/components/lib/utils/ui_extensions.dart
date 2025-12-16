import 'package:flutter/material.dart';

extension UiClickable on Widget {
  Widget asButton({
    required VoidCallback onPressed,
    BorderRadius? borderRadius,
    Color? hoverColor,
    Color? splashColor,
  }) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        hoverColor: hoverColor,
        splashColor: splashColor,
        borderRadius: borderRadius,
        child: this,
      ),
    );
  }
}
