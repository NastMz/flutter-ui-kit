import 'package:flutter/widgets.dart';
import 'package:core/core.dart';

/// UiScrollArea
/// A token-styled scroll container that wraps a single child and shows
/// platform-appropriate scrollbars with design tokens.
class UiScrollArea extends StatefulWidget {
  final Widget child;
  final Axis axis;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final bool showScrollbar;
  final bool primary;

  const UiScrollArea({
    super.key,
    required this.child,
    this.axis = Axis.vertical,
    this.padding,
    this.controller,
    this.showScrollbar = true,
    this.primary = false,
  });

  @override
  State<UiScrollArea> createState() => _UiScrollAreaState();
}

class _UiScrollAreaState extends State<UiScrollArea> {
  ScrollController? _internalController;

  ScrollController get _controller => widget.controller ?? _internalController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = ScrollController();
    }
  }

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final scrollable = SingleChildScrollView(
      scrollDirection: widget.axis,
      controller: _controller,
      primary: widget.primary,
      padding: widget.padding ?? EdgeInsets.all(ui.spacing.sm),
      child: widget.child,
    );

    if (!widget.showScrollbar) return scrollable;

    return RawScrollbar(
      controller: _controller,
      thumbVisibility: true,
      trackVisibility: false,
      thickness: 6,
      radius: Radius.circular(UiTheme.of(context).radius.sm),
      thumbColor: UiTheme.of(context).colors.mutedForeground,
      child: scrollable,
    );
  }
}
