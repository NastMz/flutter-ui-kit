import 'package:flutter/foundation.dart';

@immutable
class FontTokens {
  final String sans;
  final String mono;

  const FontTokens({required this.sans, required this.mono});

  factory FontTokens.standard() {
    return const FontTokens(sans: 'Inter', mono: 'JetBrains Mono');
  }

  FontTokens lerp(FontTokens other, double t) {
    return this;
  }
}
