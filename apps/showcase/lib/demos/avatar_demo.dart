import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AvatarDemo extends StatelessWidget {
  const AvatarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: UiSpacing.lg,
      children: [
        VStack(
          crossAxisAlignment: CrossAxisAlignment.start,
          gap: UiSpacing.md,
          children: [
            UiText.p(
              'Avatar Sizes',
              style: ui.typography.textSm.copyWith(fontWeight: FontWeight.bold),
            ),
            HStack(
              gap: UiSpacing.md,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UiAvatar(fallback: 'JD', size: UiAvatarSize.sm),
                UiAvatar(fallback: 'AD', size: UiAvatarSize.md),
                UiAvatar(fallback: 'MK', size: UiAvatarSize.lg),
                UiAvatar(fallback: 'RS', size: UiAvatarSize.xl),
              ],
            ),
          ],
        ),
        VStack(
          crossAxisAlignment: CrossAxisAlignment.start,
          gap: UiSpacing.md,
          children: [
            UiText.p(
              'Avatar Group',
              style: ui.typography.textSm.copyWith(fontWeight: FontWeight.bold),
            ),
            UiAvatarGroup(
              avatars: [
                UiAvatar(fallback: 'JD', size: UiAvatarSize.md),
                UiAvatar(fallback: 'AD', size: UiAvatarSize.md),
                UiAvatar(fallback: 'MK', size: UiAvatarSize.md),
              ],
              size: UiAvatarSize.md,
            ),
          ],
        ),
      ],
    );
  }
}
