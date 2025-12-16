import 'package:flutter/material.dart';

extension UiClickable on Widget {
  Widget asButton({required VoidCallback onPressed}) {
    return InkWell(onTap: onPressed, child: this);
  }
}
