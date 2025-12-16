import 'package:flutter/material.dart';
import 'spacing_tokens.dart';

/// Button-specific sizing (height + padding).
@immutable
class ButtonSizes {
  final double height;
  final double paddingX;
  final double paddingY;

  const ButtonSizes({
    required this.height,
    required this.paddingX,
    required this.paddingY,
  });
}

/// Input-specific sizing (height + padding).
@immutable
class InputSizes {
  final double height;
  final double paddingX;
  final double paddingY;

  const InputSizes({
    required this.height,
    required this.paddingX,
    required this.paddingY,
  });
}

/// Component-specific size tokens matching shadcn.
/// Each component type has its own appropriate scale.
///
/// Note: shadcn uses 3 button/input sizes: sm, default, lg.
/// We map 'md' to shadcn's 'default' size.
@immutable
class SizesTokens {
  // ===== Buttons (shadcn: sm, default, lg) =====
  final ButtonSizes buttonSm;
  final ButtonSizes buttonDefault;
  final ButtonSizes buttonLg;

  // ===== Inputs (shadcn: sm, default, lg) =====
  final InputSizes inputSm;
  final InputSizes inputDefault;
  final InputSizes inputLg;

  // ===== Icons =====
  final double iconXs;
  final double iconSm;
  final double iconMd;
  final double iconLg;
  final double iconXl;

  // ===== Checkbox/Radio =====
  /// Fixed size for checkbox and radio (16px like shadcn).
  final double checkboxSize;

  // ===== Switch =====
  final double switchWidth;
  final double switchHeight;

  const SizesTokens({
    required this.buttonSm,
    required this.buttonDefault,
    required this.buttonLg,
    required this.inputSm,
    required this.inputDefault,
    required this.inputLg,
    required this.iconXs,
    required this.iconSm,
    required this.iconMd,
    required this.iconLg,
    required this.iconXl,
    required this.checkboxSize,
    required this.switchWidth,
    required this.switchHeight,
  });

  /// Standard sizes matching shadcn exactly.
  /// shadcn uses: sm (36), default (40), lg (44).
  factory SizesTokens.standard({SpacingTokens? spacing}) {
    return SizesTokens(
      // Buttons: shadcn sm/default/lg
      buttonSm: const ButtonSizes(height: 36, paddingX: 12, paddingY: 0),
      buttonDefault: const ButtonSizes(height: 40, paddingX: 16, paddingY: 0),
      buttonLg: const ButtonSizes(height: 44, paddingX: 20, paddingY: 0),
      // Inputs: shadcn sm/default/lg
      inputSm: const InputSizes(height: 36, paddingX: 12, paddingY: 8),
      inputDefault: const InputSizes(height: 40, paddingX: 16, paddingY: 10),
      inputLg: const InputSizes(height: 44, paddingX: 20, paddingY: 12),
      // Icons
      iconXs: 12,
      iconSm: 16,
      iconMd: 20,
      iconLg: 24,
      iconXl: 28,
      // Checkbox/Radio: fixed 16px
      checkboxSize: 16,
      // Switch: compact track
      switchWidth: 40,
      switchHeight: 24,
    );
  }

  // ===== Convenience aliases =====
  /// Alias for buttonDefault (md maps to shadcn's default).
  ButtonSizes get buttonMd => buttonDefault;

  /// Alias for inputDefault (md maps to shadcn's default).
  InputSizes get inputMd => inputDefault;
}
