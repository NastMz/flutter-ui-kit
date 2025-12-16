import 'package:flutter/widgets.dart';
import 'package:core/core.dart';
import 'package:components/components.dart';
import 'package:components/utils/ui_extensions.dart';

/// UiSidebar
/// A vertical navigation sidebar with token-based styling.
class UiSidebar extends StatelessWidget {
  /// Flat list of items (legacy API). Prefer [sections] + [selectedValue].
  final List<UiSidebarItem> items;

  /// Sections with labels (shadcn-like API). If provided, [selectedValue]
  /// and [onSelectedValue] should be used.
  final List<UiSidebarSection>? sections;

  /// Selected index for legacy API.
  final int selectedIndex;

  /// Callback for legacy selection.
  final ValueChanged<int>? onSelected;

  /// Selected value key (recommended API).
  final String? selectedValue;

  /// Callback when selection changes by value.
  final ValueChanged<String>? onSelectedValue;

  /// Optional header widget (e.g., app name / logo).
  final Widget? header;

  /// Optional footer widget (e.g., user profile or actions).
  final Widget? footer;

  /// Sidebar width.
  final double? width;

  const UiSidebar({
    super.key,
    this.items = const [],
    this.selectedIndex = 0,
    this.onSelected,
    this.width,
    this.sections,
    this.selectedValue,
    this.onSelectedValue,
    this.header,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final hasSections = sections != null && sections!.isNotEmpty;
    return UiBox(
      width: width ?? 240,
      height: double.infinity,
      backgroundColor: ui.colors.muted,
      borderColor: ui.colors.border,
      borderWidth: 1,
      child: UiInset(
        all: UiSpacing.sm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (header != null) ...[header!, UiGap(UiSpacing.sm)],
            Expanded(
              child: UiScrollArea(
                axis: Axis.vertical,
                padding: EdgeInsets.zero,
                child: VStack(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  gap: UiSpacing.sm,
                  children: hasSections
                      ? _buildSectioned(context)
                      : _buildFlat(context),
                ),
              ),
            ),
            if (footer != null) ...[UiGap(UiSpacing.sm), footer!],
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFlat(BuildContext context) {
    final ui = UiTheme.of(context);
    return [
      for (var i = 0; i < items.length; i++)
        _buildItem(
          context,
          item: items[i],
          selected: selectedValue != null
              ? items[i].value == selectedValue
              : i == selectedIndex,
          onTap: () {
            if (onSelectedValue != null && items[i].value != null) {
              onSelectedValue!(items[i].value!);
            } else {
              onSelected?.call(i);
            }
          },
          ui: ui,
        ),
    ];
  }

  List<Widget> _buildSectioned(BuildContext context) {
    final ui = UiTheme.of(context);
    final widgets = <Widget>[];
    for (var index = 0; index < sections!.length; index++) {
      final section = sections![index];
      final isLast = index == sections!.length - 1;
      if (section.label != null) {
        widgets.add(
          UiText.small(
            section.label!,
            style: ui.typography.textSm.copyWith(
              fontWeight: FontWeight.w600,
              color: ui.colors.mutedForeground,
            ),
          ),
        );
      }
      widgets.addAll([
        UiGap(UiSpacing.xs),
        ...section.items.map((item) {
          final isSelected = selectedValue != null
              ? item.value == selectedValue
              : false;
          return _buildItem(
            context,
            item: item,
            selected: isSelected,
            onTap: () {
              if (onSelectedValue != null && item.value != null) {
                onSelectedValue!(item.value!);
              }
            },
            ui: ui,
          );
        }),
        if (!isLast) UiGap(UiSpacing.sm),
      ]);
    }
    return widgets;
  }

  Widget _buildItem(
    BuildContext context, {
    required UiSidebarItem item,
    required bool selected,
    required VoidCallback onTap,
    required UiThemeData ui,
  }) {
    final bgColor = selected ? ui.colors.accent : null;
    final textColor = selected
        ? ui.colors.foreground
        : ui.colors.mutedForeground;
    final iconColor = textColor;
    final hoverColor = selected
        ? ui.colors.accent
        : ui.colors.accent.withValues(alpha: 0.15);

    final content = IconTheme(
      data: IconThemeData(
        color: iconColor,
        size: UiTheme.of(context).sizes.iconSm,
      ),
      child: HStack(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left selected indicator
          UiBox(
            width: 3,
            height: ui.sizes.iconMd,
            backgroundColor: selected
                ? ui.colors.primary
                : ui.colors.background.withValues(alpha: 0),
            child: const SizedBox.shrink(),
          ),
          // Content with padding
          Expanded(
            child: UiInset(
              horizontal: UiSpacing.sm,
              vertical: UiSpacing.xs,
              child: HStack(
                gap: UiSpacing.xs,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (item.icon != null) item.icon!,
                  Expanded(
                    child: UiText.small(
                      item.label,
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  if (item.trailing != null) item.trailing!,
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return UiBox(
      backgroundColor: bgColor,
      borderRadius: ui.radius.sm,
      child: content,
    ).asButton(
      onPressed: onTap,
      borderRadius: BorderRadius.circular(ui.radius.sm),
      hoverColor: hoverColor,
      splashColor: hoverColor,
    );
  }
}

class UiSidebarItem {
  final String label;

  /// Optional value key used for selection callbacks.
  final String? value;
  final Widget? icon;
  final Widget? trailing;

  UiSidebarItem({required this.label, this.value, this.icon, this.trailing});
}

class UiSidebarSection {
  final String? label;
  final List<UiSidebarItem> items;

  UiSidebarSection({this.label, required this.items});
}
