import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'demos/avatar_demo.dart';
import 'demos/badge_demo.dart';
import 'demos/button_demo.dart';
import 'demos/card_demo.dart';
import 'demos/form_field_demo.dart';
import 'demos/input_additional_demo.dart';
import 'demos/input_controls_demo.dart';
import 'demos/input_demo.dart';
import 'demos/layout_patterns_page_demo.dart';
import 'demos/layout_primitives_demo.dart';
import 'demos/ui_box_demo.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatefulWidget {
  const ShowcaseApp({super.key});

  @override
  State<ShowcaseApp> createState() => _ShowcaseAppState();
}

class _ShowcaseAppState extends State<ShowcaseApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Kit Showcase',
      debugShowCheckedModeBanner: false,
      theme: UiTheme.applyTo(
        ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            brightness: _isDarkMode ? Brightness.dark : Brightness.light,
          ),
        ),
        _isDarkMode
            ? UiThemeData.dark(
                fontSans: GoogleFonts.inter(),
                fontMono: GoogleFonts.jetBrainsMono(),
              )
            : UiThemeData.light(
                fontSans: GoogleFonts.inter(),
                fontMono: GoogleFonts.jetBrainsMono(),
              ),
      ),
      home: ShowcaseHome(isDarkMode: _isDarkMode, onToggleTheme: _toggleTheme),
    );
  }
}

class ShowcaseHome extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const ShowcaseHome({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<ShowcaseHome> createState() => _ShowcaseHomeState();
}

class _ShowcaseHomeState extends State<ShowcaseHome> {
  int _selectedIndex = 0;

  String get _selectedValue => _demos[_selectedIndex].label;

  final List<({String label, IconData icon, Widget demo})> _demos = [
    (label: 'Buttons', icon: Icons.smart_button, demo: const ButtonDemo()),
    (label: 'Inputs', icon: Icons.input, demo: const InputDemo()),
    (
      label: 'Input Controls',
      icon: Icons.check_box,
      demo: const InputControlsDemo(),
    ),
    (
      label: 'Input Additional',
      icon: Icons.text_fields,
      demo: const InputAdditionalDemo(),
    ),
    (label: 'Cards', icon: Icons.web_asset, demo: const CardDemo()),
    (label: 'Badge', icon: Icons.label, demo: const BadgeDemo()),
    (label: 'Avatar', icon: Icons.person, demo: const AvatarDemo()),
    (label: 'Box', icon: Icons.border_all, demo: const UiBoxDemo()),
    (
      label: 'Layout Primitives',
      icon: Icons.dashboard,
      demo: const LayoutPrimitivesDemo(),
    ),
    (
      label: 'Layout Patterns',
      icon: Icons.view_week,
      demo: const LayoutPatternsPageDemo(),
    ),
    (label: 'Form Field', icon: Icons.input, demo: const FormFieldDemo()),
  ];

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    // Theme toggle control (used in sidebar footer)
    final themeToggle = UiInset(
      horizontal: UiSpacing.sm,
      vertical: UiSpacing.xs,
      child: HStack(
        gap: UiSpacing.sm,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.light_mode, size: 18, color: ui.colors.mutedForeground),
          UiSwitch(
            value: widget.isDarkMode,
            onChanged: (_) => widget.onToggleTheme(),
          ),
          Icon(Icons.dark_mode, size: 18, color: ui.colors.mutedForeground),
        ],
      ),
    );

    // Navigation sidebar using UiSidebar
    final sidebar = UiSidebar(
      sections: [
        UiSidebarSection(
          label: 'Components',
          items: _demos
              .map(
                (d) => UiSidebarItem(
                  label: d.label,
                  value: d.label,
                  icon: Icon(d.icon),
                ),
              )
              .toList(),
        ),
      ],
      selectedIndex: _selectedIndex, // legacy fallback
      onSelected: (index) => setState(() => _selectedIndex = index),
      selectedValue: _selectedValue,
      onSelectedValue: (value) {
        final idx = _demos.indexWhere((d) => d.label == value);
        if (idx != -1) setState(() => _selectedIndex = idx);
      },
      header: UiInset(
        horizontal: UiSpacing.sm,
        vertical: UiSpacing.xs,
        child: UiText.p(
          'Flutter UI Kit Showcase',
          style: ui.typography.textSm.copyWith(
            color: ui.colors.mutedForeground,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      footer: themeToggle,
    );

    // Main content area using UiScrollArea
    final mainContent = Expanded(
      child: UiScrollArea(
        axis: Axis.vertical,
        child: UiPage(
          isStandalone: false,
          maxWidth: 900,
          padding: UiSpacing.xl,
          child: VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiText.h2(_demos[_selectedIndex].label),
              const UiGap(UiSpacing.sm),
              const UiText.muted('Component demonstration'),
              const UiGap.manual(32),
              UiBox(
                borderColor: ui.colors.border,
                borderWidth: 1,
                borderRadius: ui.radius.lg,
                child: UiInset(
                  all: UiSpacing.xl,
                  child: _demos[_selectedIndex].demo,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: ui.colors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          sidebar,
          UiSeparator(direction: UiSeparatorDirection.vertical),
          mainContent,
        ],
      ),
    );
  }
}
