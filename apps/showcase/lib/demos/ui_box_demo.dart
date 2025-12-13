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
                child: Text(
                  'Box with padding (all sides)',
                  style: ui.typography.textSm,
                ),
              ),
              UiBox(
                paddingHorizontal: UiSpacing.lg,
                paddingVertical: UiSpacing.sm,
                backgroundColor: ui.colors.muted,
                borderRadius: ui.radius.sm,
                child: Text(
                  'Custom horizontal/vertical padding',
                  style: ui.typography.textSm,
                ),
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
                    child: Text(
                      'Primary',
                      style: ui.typography.textSm.copyWith(
                        color: ui.colors.onPrimary,
                      ),
                    ),
                  ),
                  UiBox(
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.secondary,
                    borderRadius: ui.radius.md,
                    child: Text(
                      'Secondary',
                      style: ui.typography.textSm.copyWith(
                        color: ui.colors.onSecondary,
                      ),
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
                child: Text('Box with border', style: ui.typography.textSm),
              ),
              UiBox(
                padding: UiSpacing.md,
                borderColor: ui.colors.destructive,
                borderWidth: 1,
                borderRadius: ui.radius.sm,
                backgroundColor: ui.colors.destructive.withValues(alpha: 0.1),
                child: Text(
                  'Error state',
                  style: ui.typography.textSm.copyWith(
                    color: ui.colors.destructive,
                  ),
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
                child: Text(
                  'Fixed size',
                  style: ui.typography.textSm.copyWith(
                    color: ui.colors.accentForeground,
                  ),
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
                    child: Text(
                      '100%',
                      style: ui.typography.textSm.copyWith(
                        color: ui.colors.onPrimary,
                      ),
                    ),
                  ),
                  UiBox(
                    opacity: 0.5,
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.primary,
                    borderRadius: ui.radius.md,
                    child: Text(
                      '50%',
                      style: ui.typography.textSm.copyWith(
                        color: ui.colors.onPrimary,
                      ),
                    ),
                  ),
                  UiBox(
                    opacity: 0.25,
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.primary,
                    borderRadius: ui.radius.md,
                    child: Text(
                      '25%',
                      style: ui.typography.textSm.copyWith(
                        color: ui.colors.onPrimary,
                      ),
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
