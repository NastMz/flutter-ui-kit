import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Avatar size options.
enum UiAvatarSize {
  /// Small avatar (32x32).
  sm,

  /// Medium avatar (40x40).
  md,

  /// Large avatar (48x48).
  lg,

  /// Extra large avatar (56x56).
  xl,
}

extension UiAvatarSizeValue on UiAvatarSize {
  double get size {
    return switch (this) {
      UiAvatarSize.sm => 32,
      UiAvatarSize.md => 40,
      UiAvatarSize.lg => 48,
      UiAvatarSize.xl => 56,
    };
  }
}

/// An avatar widget for displaying user profile images with fallback initials.
///
/// Example:
/// ```dart
/// UiAvatar(
///   image: NetworkImage('https://...'),
///   fallback: 'JD',
/// )
/// ```
class UiAvatar extends StatelessWidget {
  /// The image to display. Can be NetworkImage, FileImage, AssetImage, etc.
  final ImageProvider? image;

  /// Fallback text when image is not available (usually initials).
  final String fallback;

  /// The avatar size.
  final UiAvatarSize size;

  /// Background color for the fallback text container.
  final Color? backgroundColor;

  /// Text color for the fallback text.
  final Color? textColor;

  /// Creates an avatar.
  const UiAvatar({
    super.key,
    this.image,
    required this.fallback,
    this.size = UiAvatarSize.md,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final avatarSize = size.size;

    final bgColor = backgroundColor ?? ui.colors.secondary;
    final textCol = textColor ?? ui.colors.onSecondary;

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        image: image != null
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  // Fallback to text when image fails to load
                },
              )
            : null,
      ),
      child: image == null
          ? Center(
              child: Text(
                fallback,
                style: ui.typography.textSm.copyWith(
                  color: textCol,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : null,
    );
  }
}

/// A group of avatars displayed in an overlapping stack.
///
/// Example:
/// ```dart
/// UiAvatarGroup(
///   avatars: [
///     UiAvatar(image: NetworkImage('...'), fallback: 'JD'),
///     UiAvatar(image: NetworkImage('...'), fallback: 'AD'),
///   ],
///   size: UiAvatarSize.sm,
/// )
/// ```
class UiAvatarGroup extends StatelessWidget {
  /// List of avatar widgets to display in the group.
  final List<UiAvatar> avatars;

  /// The avatar size for all avatars in the group.
  final UiAvatarSize size;

  /// Overlap amount between avatars (negative offset).
  final double overlap;

  /// Creates an avatar group.
  const UiAvatarGroup({
    super.key,
    required this.avatars,
    this.size = UiAvatarSize.md,
    this.overlap = 8,
  });

  @override
  Widget build(BuildContext context) {
    if (avatars.isEmpty) {
      return const SizedBox.shrink();
    }

    final borderWidth = 2.0;
    final totalWidth = avatars.length * (size.size - overlap) + overlap;

    return SizedBox(
      width: totalWidth + borderWidth * 2,
      height: size.size + borderWidth * 2,
      child: Stack(
        children: [
          for (int i = 0; i < avatars.length; i++)
            Positioned(
              left: i * (size.size - overlap),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: borderWidth),
                ),
                child: avatars[i],
              ),
            ),
        ],
      ),
    );
  }
}
