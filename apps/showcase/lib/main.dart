import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'demos/avatar_demo.dart';
import 'demos/badge_demo.dart';
import 'demos/button_demo.dart';
import 'demos/card_demo.dart';
import 'demos/input_controls_demo.dart';
import 'demos/input_demo.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Kit Showcase',
      debugShowCheckedModeBanner: false,
      theme: UiTheme.applyTo(
        ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        UiThemeData.light(
          fontSans: GoogleFonts.inter(),
          fontMono: GoogleFonts.jetBrainsMono(),
        ),
      ),
      home: const ShowcaseHome(),
    );
  }
}

class ShowcaseHome extends StatefulWidget {
  const ShowcaseHome({super.key});

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
    (label: 'Cards', icon: Icons.web_asset, demo: const CardDemo()),
    (label: 'Badge', icon: Icons.label, demo: const BadgeDemo()),
    (label: 'Avatar', icon: Icons.person, demo: const AvatarDemo()),
  ];

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return Scaffold(
      backgroundColor: ui.colors.background,
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
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
            child: Container(
              color: ui.colors.background,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(32),
                  child: VStack(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiText.h2(_demos[_selectedIndex].label),
                      const UiGap(UiSpacing.sm),
                      const UiText.muted('Component demonstration'),
                      const UiGap.manual(32),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ui.colors.border),
                          borderRadius: BorderRadius.circular(ui.radius.lg),
                        ),
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
        ],
      ),
    );
  }
}
