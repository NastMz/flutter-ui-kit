import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class BadgeDemo extends StatelessWidget {
  const BadgeDemo({super.key});

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
              'Badge Variants',
              style: ui.typography.textSm.copyWith(fontWeight: FontWeight.bold),
            ),
            HStack(
              gap: UiSpacing.md,
              children: [
                UiBadge(label: 'Default', variant: UiBadgeVariant.default_),
                UiBadge(label: 'Secondary', variant: UiBadgeVariant.secondary),
                UiBadge(
                  label: 'Destructive',
                  variant: UiBadgeVariant.destructive,
                ),
                UiBadge(label: 'Outline', variant: UiBadgeVariant.outline),
              ],
            ),
          ],
        ),
        VStack(
          crossAxisAlignment: CrossAxisAlignment.start,
          gap: UiSpacing.md,
          children: [
            UiText.p(
              'Common Use Cases',
              style: ui.typography.textSm.copyWith(fontWeight: FontWeight.bold),
            ),
            HStack(
              gap: UiSpacing.md,
              children: [
                UiBadge(label: 'New', variant: UiBadgeVariant.default_),
                UiBadge(label: '5 days', variant: UiBadgeVariant.secondary),
                UiBadge(label: 'Alert', variant: UiBadgeVariant.destructive),
                UiBadge(label: 'Info', variant: UiBadgeVariant.outline),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
