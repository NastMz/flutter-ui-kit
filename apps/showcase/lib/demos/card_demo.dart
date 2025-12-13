import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return SizedBox(
      width: 350,
      child: UiCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            UiCardHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiCardTitle(child: Text('Create project')),
                  const SizedBox(height: 4),
                  UiCardDescription(
                    child: Text('Deploy your new project in one-click.'),
                  ),
                ],
              ),
            ),
            UiCardContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: ui.typography.textSm.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const UiTextField(placeholder: 'Name of your project'),
                  const SizedBox(height: 16),
                  Text(
                    'Framework',
                    style: ui.typography.textSm.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const UiTextField(placeholder: 'Select'),
                ],
              ),
            ),
            UiCardFooter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiButton(
                    variant: UiButtonVariant.outline,
                    onPressed: () {},
                    child: const Text('Cancel'),
                  ),
                  UiButton(onPressed: () {}, child: const Text('Deploy')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
