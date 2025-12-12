import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:components/components.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatefulWidget {
  const ShowcaseApp({super.key});

  @override
  State<ShowcaseApp> createState() => _ShowcaseAppState();
}

class _ShowcaseAppState extends State<ShowcaseApp> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    final ui = _dark ? UiThemeData.dark() : UiThemeData.light();
    final base = ThemeData(useMaterial3: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: UiTheme.applyTo(base, ui),
      home: ShowcaseHome(
        dark: _dark,
        onToggleDark: (v) => setState(() => _dark = v),
      ),
    );
  }
}

class ShowcaseHome extends StatelessWidget {
  final bool dark;
  final ValueChanged<bool> onToggleDark;

  const ShowcaseHome({
    super.key,
    required this.dark,
    required this.onToggleDark,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Kit — Showcase'),
        actions: [
          Row(
            children: [
              const Text('Dark'),
              Switch(value: dark, onChanged: onToggleDark),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Theme Preview',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          _ColorTile(label: 'background', color: ui.colors.background),
          _ColorTile(label: 'foreground', color: ui.colors.foreground),
          _ColorTile(label: 'primary', color: ui.colors.primary),
          _ColorTile(label: 'border', color: ui.colors.border),
          const SizedBox(height: 24),
          Text(
            'Sample Surface',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ui.colors.background,
              border: Border.all(color: ui.colors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'If you can toggle dark/light and these colors change, '
              'the theme infrastructure is wired correctly.',
              style: TextStyle(color: ui.colors.foreground),
            ),
          ),
          const SizedBox(height: 24),
          Text('Buttons', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              UiButton(onPressed: () {}, child: const Text('Solid / MD')),
              UiButton(
                onPressed: () {},
                variant: UiButtonVariant.outline,
                child: const Text('Outline / MD'),
              ),
              UiButton(onPressed: null, child: const Text('Disabled')),
              UiButton(
                onPressed: () {},
                size: UiButtonSize.sm,
                child: const Text('SM'),
              ),
              UiButton(
                onPressed: () {},
                size: UiButtonSize.lg,
                child: const Text('LG'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Cards', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          UiCard(
            child: Text(
              'Solid card using tokens (background/border/radius/spacing).',
            ),
          ),
          const SizedBox(height: 12),
          UiCard(
            variant: UiCardVariant.outlined,
            child: Text(
              'Outlined card. Useful as the default surface for layouts.',
            ),
          ),
          const SizedBox(height: 24),
          Text('Inputs', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          UiTextField(
            label: 'Email',
            hintText: 'you@example.com',
            helperText: 'This is a helper text',
          ),
          const SizedBox(height: 12),
          UiTextField(
            label: 'Disabled',
            hintText: 'Disabled field',
            enabled: false,
          ),
          const SizedBox(height: 12),
          UiTextField(
            label: 'Error',
            hintText: 'Bad value',
            errorText: 'This is an error message',
          ),
        ],
      ),
    );
  }
}

class _ColorTile extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorTile({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: ui.colors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: ui.colors.border),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label, style: TextStyle(color: ui.colors.foreground)),
          ),
          Text(
            '#${color.toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase()}',
            style: TextStyle(
              color: ui.colors.foreground.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
