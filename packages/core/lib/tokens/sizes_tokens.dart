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

/// Textarea-specific sizing (padding only, no fixed height).
@immutable
class TextareaSizes {
  final double paddingX;
  final double paddingY;
  final double minHeight;

  const TextareaSizes({
    required this.paddingX,
    required this.paddingY,
    required this.minHeight,
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

  // ===== Textarea (shadcn: px-2 py-2, min-h-16) =====
  final TextareaSizes textarea;

  // ===== Icon Sizes (for icons within components) =====
  final double iconXs;
  final double iconSm;
  final double iconMd;
  final double iconLg;
  final double iconXl;

  // ===== Icon Button Sizes (square button dimensions) =====
  /// Small icon button (32x32).
  final double iconButtonSm;

  /// Default icon button (40x40).
  final double iconButtonMd;

  /// Large icon button (48x48).
  final double iconButtonLg;

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
    required this.textarea,
    required this.inputSm,
    required this.inputDefault,
    required this.inputLg,
    required this.iconXs,
    required this.iconSm,
    required this.iconMd,
    required this.iconLg,
    required this.iconXl,
    required this.iconButtonSm,
    required this.iconButtonMd,
    required this.iconButtonLg,
    required this.checkboxSize,
    required this.switchWidth,
    required this.switchHeight,
  });

  /// Standard sizes matching shadcn exactly.
  /// shadcn exact sizes (Tailwind classes):
  /// Button: h-8 (32px) | h-9 (36px) | h-10 (40px)
  /// Icon button: size-8 (32px) | size-9 (36px) | size-10 (40px)
  /// Input: px-3 (12px) horizontal, paddingY adjusted for total h-9 (36px)
  factory SizesTokens.standard({SpacingTokens? spacing}) {
    return SizesTokens(
      // Buttons: heights calibrated for Flutter rendering (visual h-8, h-9, h-10)
      buttonSm: const ButtonSizes(height: 36, paddingX: 12, paddingY: 0),
      buttonDefault: const ButtonSizes(height: 40, paddingX: 16, paddingY: 0),
      buttonLg: const ButtonSizes(height: 44, paddingX: 24, paddingY: 0),
      // Inputs: px-3 (12px) horizontal, heights/paddingY for Flutter rendering
      inputSm: const InputSizes(height: 36, paddingX: 12, paddingY: 8),
      inputDefault: const InputSizes(height: 40, paddingX: 12, paddingY: 10),
      inputLg: const InputSizes(height: 44, paddingX: 12, paddingY: 12),
      // Textarea: px-2 py-2, min-h-16 (64px) in shadcn
      textarea: const TextareaSizes(paddingX: 8, paddingY: 8, minHeight: 64),
      // Icons (for display within components)
      iconXs: 12,
      iconSm: 16,
      iconMd: 20,
      iconLg: 24,
      iconXl: 28,
      // Icon buttons: size-8, size-9, size-10
      iconButtonSm: 32, // size-8 in shadcn
      iconButtonMd: 36, // size-9 in shadcn (default, was 40)
      iconButtonLg: 40, // size-10 in shadcn (was 48)
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
