import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'demos/avatar_demo.dart';
import 'demos/badge_demo.dart';
import 'demos/button_demo.dart';
import 'demos/card_demo.dart';
import 'demos/input_additional_demo.dart';
import 'demos/input_controls_demo.dart';
import 'demos/input_demo.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return Scaffold(
      backgroundColor: ui.colors.background,
      appBar: AppBar(
        backgroundColor: ui.colors.background,
        elevation: 0,
        title: Text(
          'Flutter UI Kit Showcase',
          style: ui.typography.title.copyWith(color: ui.colors.foreground),
        ),
        actions: [
          UiInset(
            horizontal: UiSpacing.md,
            child: HStack(
              gap: UiSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.light_mode,
                  size: 20,
                  color: ui.colors.mutedForeground,
                ),
                UiSwitch(
                  value: widget.isDarkMode,
                  onChanged: (_) => widget.onToggleTheme(),
                ),
                Icon(
                  Icons.dark_mode,
                  size: 20,
                  color: ui.colors.mutedForeground,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            backgroundColor: ui.colors.background,
            indicatorColor: ui.colors.primary.withValues(alpha: 0.1),
            destinations: _demos.map((demo) {
              return NavigationRailDestination(
                icon: Icon(demo.icon),
                label: Text(demo.label),
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: UiBox(
              backgroundColor: ui.colors.background,
              child: Center(
                child: SingleChildScrollView(
                  child: UiInset(
                    all: UiSpacing.xl,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
