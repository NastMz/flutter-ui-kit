import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LayoutPrimitivesDemo extends StatelessWidget {
  const LayoutPrimitivesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return UiBox(
      width: 500,
      child: VStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        gap: UiSpacing.xl,
        children: [
          // UiSpacer - Flexible
          _Section(
            title: 'UiSpacer - Flexible',
            description: 'Pushes content to edges (like Spacer)',
            child: UiBox(
              padding: UiSpacing.md,
              backgroundColor: ui.colors.muted,
              borderRadius: ui.radius.md,
              child: HStack(
                children: [
                  _Badge('Left'),
                  UiSpacer(),
                  _Badge('Right'),
                ],
              ),
            ),
          ),

          // UiSpacer - Fixed
          _Section(
            title: 'UiSpacer - Fixed',
            description: 'Adds exact spacing using tokens',
            child: UiBox(
              padding: UiSpacing.md,
              backgroundColor: ui.colors.muted,
              borderRadius: ui.radius.md,
              child: VStack(
                gap: UiSpacing.xs,
                children: [
                  _Badge('Box 1'),
                  UiSpacer(space: UiSpacing.lg),
                  _Badge('Box 2 (large gap above)'),
                ],
              ),
            ),
          ),

          // Responsive - Show/Hide
          _Section(
            title: 'UiResponsive & UiHidden',
            description: 'Show or hide based on screen width',
            child: VStack(
              gap: UiSpacing.md,
              children: [
                UiResponsive(
                  showAbove: UiBreakpoints.md,
                  fallback: UiBox(
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.destructive.withValues(alpha: 0.1),
                    borderRadius: ui.radius.md,
                    child: Text(
                      '❌ Hidden (screen < 1024px)',
                      style: ui.typography.textSm.copyWith(
                        color: ui.colors.destructiveForeground,
                      ),
                    ),
                  ),
                  child: UiBox(
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.primary.withValues(alpha: 0.1),
                    borderRadius: ui.radius.md,
                    child: Text(
                      '✓ Visible (screen ≥ 1024px)',
                      style: ui.typography.textSm.copyWith(
                        color: ui.colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                UiHidden(
                  hideBelow: UiBreakpoints.sm,
                  child: UiBox(
                    padding: UiSpacing.md,
                    backgroundColor: ui.colors.accent.withValues(alpha: 0.1),
                    borderRadius: ui.radius.md,
                    child: Text(
                      '✓ Hidden when screen < 640px',
                      style: ui.typography.textSm.copyWith(
                        color: ui.colors.accentForeground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Breakpoints Reference
          _Section(
            title: 'Breakpoints',
            description: 'Available responsive breakpoints',
            child: VStack(
              gap: UiSpacing.sm,
              children: [
                _BreakpointRow('sm', UiBreakpoints.sm, 'Small devices'),
                _BreakpointRow('md', UiBreakpoints.md, 'Tablets'),
                _BreakpointRow('lg', UiBreakpoints.lg, 'Laptops'),
                _BreakpointRow('xl', UiBreakpoints.xl, 'Desktops'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const _Section({
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: UiSpacing.sm,
      children: [
        UiText.h4(title),
        UiText.small(
          description,
          style: ui.typography.textSm.copyWith(
            color: ui.colors.mutedForeground,
          ),
        ),
        child,
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;

  const _Badge(this.text);

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return UiBox(
      padding: UiSpacing.sm,
      backgroundColor: ui.colors.primary,
      borderRadius: ui.radius.sm,
      child: Text(
        text,
        style: ui.typography.textSm.copyWith(
          color: ui.colors.onPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _BreakpointRow extends StatelessWidget {
  final String label;
  final double value;
  final String description;

  const _BreakpointRow(this.label, this.value, this.description);

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return UiBox(
      padding: UiSpacing.sm,
      backgroundColor: ui.colors.muted,
      borderRadius: ui.radius.sm,
      child: HStack(
        children: [
          UiBox(
            width: 40,
            child: Text(
              label,
              style: ui.typography.textSm.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: 'monospace',
              ),
            ),
          ),
          UiBox(
            width: 60,
            child: Text(
              '${value.toInt()}px',
              style: ui.typography.textSm.copyWith(
                color: ui.colors.mutedForeground,
              ),
            ),
          ),
          UiSpacer(),
          Text(
            description,
            style: ui.typography.textSm.copyWith(
              color: ui.colors.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}
