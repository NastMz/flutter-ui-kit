import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class UiBoxDemo extends StatelessWidget {
  const UiBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return UiBox(
      width: 400,
      child: VStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        gap: UiSpacing.lg,
        children: [
          // Basic padding
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.h4('Padding'),
              UiBox(
                padding: UiSpacing.md,
                backgroundColor: ui.colors.muted,
                borderRadius: ui.radius.sm,
                child: UiText.small('Box with padding (all sides)'),
              ),
              UiBox(
                paddingHorizontal: UiSpacing.lg,
                paddingVertical: UiSpacing.sm,
                backgroundColor: ui.colors.muted,
                borderRadius: ui.radius.sm,
                child: UiText.small('Custom horizontal/vertical padding'),
              ),
            ],
          ),

          // Backgrounds & Colors
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.h4('Backgrounds'),
              HStack(
                gap: UiSpacing.md,
                children: [
                  UiBox(
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.primary,
                    borderRadius: ui.radius.md,
                    child: UiText.small(
                      'Primary',
                      style: TextStyle(color: ui.colors.onPrimary),
                    ),
                  ),
                  UiBox(
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.secondary,
                    borderRadius: ui.radius.md,
                    child: UiText.small(
                      'Secondary',
                      style: TextStyle(color: ui.colors.onSecondary),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Borders
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.h4('Borders'),
              UiBox(
                padding: UiSpacing.md,
                borderColor: ui.colors.primary,
                borderWidth: 2,
                borderRadius: ui.radius.md,
                child: UiText.small('Box with border'),
              ),
              UiBox(
                padding: UiSpacing.md,
                borderColor: ui.colors.destructive,
                borderWidth: 1,
                borderRadius: ui.radius.sm,
                backgroundColor: ui.colors.destructive.withValues(alpha: 0.1),
                child: UiText.small(
                  'Error state',
                  style: TextStyle(color: ui.colors.destructive),
                ),
              ),
            ],
          ),

          // Size constraints
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.h4('Size & Alignment'),
              UiBox(
                width: 120,
                height: 80,
                padding: UiSpacing.md,
                backgroundColor: ui.colors.accent,
                borderRadius: ui.radius.md,
                alignment: Alignment.center,
                child: UiText.small(
                  'Fixed size',
                  style: TextStyle(color: ui.colors.accentForeground),
                ),
              ),
            ],
          ),

          // Opacity
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.h4('Opacity'),
              HStack(
                gap: UiSpacing.md,
                children: [
                  UiBox(
                    opacity: 1.0,
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.primary,
                    borderRadius: ui.radius.md,
                    child: UiText.small(
                      '100%',
                      style: TextStyle(color: ui.colors.onPrimary),
                    ),
                  ),
                  UiBox(
                    opacity: 0.5,
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.primary,
                    borderRadius: ui.radius.md,
                    child: UiText.small(
                      '50%',
                      style: TextStyle(color: ui.colors.onPrimary),
                    ),
                  ),
                  UiBox(
                    opacity: 0.25,
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.primary,
                    borderRadius: ui.radius.md,
                    child: UiText.small(
                      '25%',
                      style: TextStyle(color: ui.colors.onPrimary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
