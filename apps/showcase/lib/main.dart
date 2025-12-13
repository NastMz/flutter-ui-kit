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
    final sections = _buildSections(context, ui);

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
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => sections[index],
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemCount: sections.length,
      ),
    );
  }

  List<Widget> _buildSections(BuildContext context, UiThemeData ui) {
    return [
      ShowcaseSection(
        title: 'Theme Preview',
        description: 'Core tokens applied to base surfaces.',
        child: Column(
          children: [
            _ColorTile(label: 'background', color: ui.colors.background),
            _ColorTile(label: 'foreground', color: ui.colors.foreground),
            _ColorTile(label: 'primary', color: ui.colors.primary),
            _ColorTile(label: 'border', color: ui.colors.border),
          ],
        ),
      ),
      ShowcaseSection(
        title: 'Sample Surface',
        description: 'Use this to validate elevation, borders, and copy.',
        child: Container(
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
      ),
      ShowcaseSection(
        title: 'Buttons',
        description:
            'Variants share tokens; add your own by extending UiButton.',
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            UiButton(onPressed: () {}, child: const Text('Primary / MD')),
            UiButton(
              onPressed: () {},
              variant: UiButtonVariant.secondary,
              child: const Text('Secondary'),
            ),
            UiButton(
              onPressed: () {},
              variant: UiButtonVariant.destructive,
              child: const Text('Destructive'),
            ),
            UiButton(
              onPressed: () {},
              variant: UiButtonVariant.outline,
              child: const Text('Outline'),
            ),
            UiButton(
              onPressed: () {},
              variant: UiButtonVariant.ghost,
              child: const Text('Ghost'),
            ),
            UiButton(
              onPressed: () {},
              variant: UiButtonVariant.link,
              child: const Text('Link'),
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
            UiButton(
              onPressed: () {},
              size: UiButtonSize.icon,
              child: const Icon(Icons.add, size: 16),
            ),
          ],
        ),
      ),
      ShowcaseSection(
        title: 'Cards',
        child: Column(
          children: const [
            UiCard(
              child: Text(
                'Default card using tokens (background/border/radius/spacing/shadow).',
              ),
            ),
            SizedBox(height: 12),
            UiCard(
              padding: UiCardPadding.lg,
              child: Text('Card with large padding.'),
            ),
          ],
        ),
      ),
      ShowcaseSection(
        title: 'Inputs',
        child: Column(
          children: const [
            UiTextField(
              label: 'Email',
              hintText: 'you@example.com',
              helperText: 'This is a helper text',
            ),
            SizedBox(height: 12),
            UiTextField(
              label: 'Disabled',
              hintText: 'Disabled field',
              enabled: false,
            ),
            SizedBox(height: 12),
            UiTextField(
              label: 'Error',
              hintText: 'Bad value',
              errorText: 'This is an error message',
            ),
          ],
        ),
      ),
    ];
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

class ShowcaseSection extends StatelessWidget {
  final String title;
  final Widget child;
  final String? description;

  const ShowcaseSection({
    super.key,
    required this.title,
    required this.child,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleMedium),
        if (description != null) ...[
          const SizedBox(height: 4),
          Text(description!, style: textTheme.bodyMedium),
        ],
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
