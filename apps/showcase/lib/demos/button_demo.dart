import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: UiSpacing.lg,
      children: [
        // Variants in grid layout
        _buildVariantsGrid(),
        _buildSizesColumn(),
        _buildIconButtons(),
      ],
    );
  }

  Widget _buildVariantsGrid() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: HStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        gap: UiSpacing.md,
        children: [
          _buildVariantColumn('Primary', UiButtonVariant.primary),
          _buildVariantColumn('Secondary', UiButtonVariant.secondary),
          _buildVariantColumn('Destructive', UiButtonVariant.destructive),
          _buildVariantColumn('Outline', UiButtonVariant.outline),
          _buildVariantColumn('Ghost', UiButtonVariant.ghost),
          _buildVariantColumn('Link', UiButtonVariant.link),
        ],
      ),
    );
  }

  Widget _buildVariantColumn(String label, UiButtonVariant variant) {
    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      gap: UiSpacing.sm,
      children: [
        UiText.muted(label),
        // Grid row with fixed height for alignment
        UiBox(
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: UiButton(
              onPressed: () {},
              variant: variant,
              child: Text(label),
            ),
          ),
        ),
        UiBox(
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: UiButton(
              onPressed: null,
              variant: variant,
              child: Text(label),
            ),
          ),
        ),
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
        // Icon + text example
        HStack(
          gap: UiSpacing.sm,
          children: [
            UiButton(
              onPressed: () {},
              variant: UiButtonVariant.primary,
              child: HStack(
                gap: UiSpacing.xs,
                children: const [
                  Icon(Icons.download, size: 16),
                  Text('Download'),
                ],
              ),
            ),
            UiButton(
              onPressed: () {},
              variant: UiButtonVariant.outline,
              child: HStack(
                gap: UiSpacing.xs,
                children: const [Icon(Icons.edit, size: 16), Text('Edit')],
              ),
            ),
            UiButton(
              onPressed: () {},
              variant: UiButtonVariant.link,
              child: HStack(
                gap: UiSpacing.xs,
                children: const [Icon(Icons.link, size: 16), Text('View docs')],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
