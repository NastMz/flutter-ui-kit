import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapStack(
      gap: UiSpacing.md,
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
    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      gap: UiSpacing.sm,
      children: [
        UiText.muted(label),
        UiButton(onPressed: () {}, variant: variant, child: Text(label)),
        UiButton(onPressed: null, variant: variant, child: Text(label)),
      ],
    );
  }

  Widget _buildSizesColumn() {
    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      gap: UiSpacing.sm,
      children: [
        const UiText.muted('Sizes'),
        HStack(
          crossAxisAlignment: CrossAxisAlignment.center,
          gap: UiSpacing.sm,
          children: [
            UiButton(
              onPressed: () {},
              size: UiButtonSize.sm,
              child: const Text('Small'),
            ),
            UiButton(
              onPressed: () {},
              size: UiButtonSize.md,
              child: const Text('Default'),
            ),
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
    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      gap: UiSpacing.sm,
      children: [
        const UiText.muted('Icon'),
        HStack(
          gap: UiSpacing.sm,
          children: [
            UiButton(
              onPressed: () {},
              size: UiButtonSize.icon,
              variant: UiButtonVariant.outline,
              child: const Icon(Icons.chevron_right, size: 16),
            ),
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
