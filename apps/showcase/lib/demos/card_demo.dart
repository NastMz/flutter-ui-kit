import 'package:components/components.dart';
import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: UiCard(
        child: VStack(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            UiCardHeader(
              child: VStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  UiCardTitle(child: Text('Create project')),
                  UiCardDescription(
                    child: Text('Deploy your new project in one-click.'),
                  ),
                ],
              ),
            ),
            UiCardContent(
              child: VStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  VStack(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiText.small('Name'),
                      const UiTextField(placeholder: 'Name of your project'),
                    ],
                  ),
                  VStack(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiText.small('Framework'),
                      const UiTextField(placeholder: 'Select'),
                    ],
                  ),
                ],
              ),
            ),
            UiCardFooter(
              child: HStack(
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
