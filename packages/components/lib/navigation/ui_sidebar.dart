import 'package:flutter/widgets.dart';
import 'package:core/core.dart';
import 'package:components/components.dart';
import 'package:components/utils/ui_extensions.dart';

/// UiSidebar
/// A vertical navigation sidebar with token-based styling.
class UiSidebar extends StatelessWidget {
  final List<UiSidebarItem> items;
  final int selectedIndex;
  final ValueChanged<int>? onSelected;
  final double? width;

  const UiSidebar({
    super.key,
    required this.items,
    required this.selectedIndex,
    this.onSelected,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    return UiBox(
      width: width ?? 240,
      backgroundColor: ui.colors.muted,
      child: UiInset(
        all: UiSpacing.sm,
        child: UiScrollArea(
          axis: Axis.vertical,
          padding: EdgeInsets.zero,
          child: VStack(
            gap: UiSpacing.xs,
            children: [
              for (var i = 0; i < items.length; i++) _buildItem(context, i),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int i) {
    final ui = UiTheme.of(context);
    final selected = i == selectedIndex;
    final item = items[i];
    return UiBox(
      backgroundColor: selected
          ? ui.colors.secondary.withValues(alpha: 0.2)
          : null,
      borderRadius: ui.radius.sm,
      child: UiInset(
        horizontal: UiSpacing.sm,
        vertical: UiSpacing.xs,
        child: HStack(
          gap: UiSpacing.xs,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (item.icon != null) item.icon!,
            Expanded(child: UiText.p(item.label)),
            if (item.trailing != null) item.trailing!,
          ],
        ),
      ),
    ).asButton(onPressed: () => onSelected?.call(i));
  }
}

class UiSidebarItem {
  final String label;
  final Widget? icon;
  final Widget? trailing;

  UiSidebarItem({required this.label, this.icon, this.trailing});
}
