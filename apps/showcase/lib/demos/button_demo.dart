import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildVariantColumn('Primary', UiButtonVariant.primary),
        _buildVariantColumn('Secondary', UiButtonVariant.secondary),
        _buildVariantColumn('Destructive', UiButtonVariant.destructive),
        _buildVariantColumn('Outline', UiButtonVariant.outline),
        _buildVariantColumn('Ghost', UiButtonVariant.ghost),
        _buildVariantColumn('Link', UiButtonVariant.link),
        _buildSizesColumn(),
        _buildIconButtons(),
      ],
    );
  }

  Widget _buildVariantColumn(String label, UiButtonVariant variant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 8),
        UiButton(onPressed: () {}, variant: variant, child: Text(label)),
        const SizedBox(height: 8),
        UiButton(onPressed: null, variant: variant, child: Text(label)),
      ],
    );
  }

  Widget _buildSizesColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Sizes', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UiButton(
              onPressed: () {},
              size: UiButtonSize.sm,
              child: const Text('Small'),
            ),
            const SizedBox(width: 8),
            UiButton(
              onPressed: () {},
              size: UiButtonSize.md,
              child: const Text('Default'),
            ),
            const SizedBox(width: 8),
            UiButton(
              onPressed: () {},
              size: UiButtonSize.lg,
              child: const Text('Large'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Icon', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 8),
        Row(
          children: [
            UiButton(
              onPressed: () {},
              size: UiButtonSize.icon,
              variant: UiButtonVariant.outline,
              child: const Icon(Icons.chevron_right, size: 16),
            ),
            const SizedBox(width: 8),
            UiButton(
              onPressed: () {},
              size: UiButtonSize.icon,
              variant: UiButtonVariant.ghost,
              child: const Icon(Icons.more_horiz, size: 16),
            ),
          ],
        ),
      ],
    );
  }
}
