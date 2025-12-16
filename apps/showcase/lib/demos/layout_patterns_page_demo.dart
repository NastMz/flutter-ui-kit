import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LayoutPatternsPageDemo extends StatefulWidget {
  const LayoutPatternsPageDemo({super.key});

  @override
  State<LayoutPatternsPageDemo> createState() => _LayoutPatternsPageDemoState();
}

class _LayoutPatternsPageDemoState extends State<LayoutPatternsPageDemo> {
  bool _emailNotifications = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return UiPage(
      isStandalone: false,
      title: 'Layout Patterns',
      maxWidth: 900,
      child: VStack(
        gap: UiSpacing.xl,
        children: [
          // Sections example
          UiSection(
            title: 'Page Sections',
            description: 'Organize content with titled sections',
            child: VStack(
              gap: UiSpacing.lg,
              children: [
                UiSection(
                  title: 'Profile Information',
                  description: 'View and edit your profile',
                  padding: UiSpacing.md,
                  backgroundColor: ui.colors.muted,
                  child: VStack(
                    gap: UiSpacing.md,
                    children: [
                      VStack(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        gap: UiSpacing.sm,
                        children: [
                          UiText.small('Name'),
                          SizedBox(
                            height: 40,
                            child: const UiTextField(placeholder: 'John Doe'),
                          ),
                        ],
                      ),
                      VStack(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        gap: UiSpacing.sm,
                        children: [
                          UiText.small('Email'),
                          SizedBox(
                            height: 40,
                            child: const UiTextField(
                              placeholder: 'john@example.com',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                UiSection(
                  title: 'Preferences',
                  padding: UiSpacing.md,
                  backgroundColor: ui.colors.muted,
                  child: VStack(
                    gap: UiSpacing.md,
                    children: [
                      HStack(
                        children: [
                          Expanded(child: UiText.p('Email Notifications')),
                          UiSwitch(
                            value: _emailNotifications,
                            onChanged: (value) {
                              setState(() => _emailNotifications = value);
                            },
                          ),
                        ],
                      ),
                      HStack(
                        children: [
                          Expanded(child: UiText.p('Dark Mode')),
                          UiSwitch(
                            value: _darkMode,
                            onChanged: (value) {
                              setState(() => _darkMode = value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // List example
          UiSection(
            title: 'Lists & Items',
            description: 'Consistent list item styling and spacing',
            child: VStack(
              gap: UiSpacing.md,
              children: [
                UiText.p(
                  'Basic List:',
                  style: ui.typography.textSm.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                UiList(
                  children: [
                    UiListItem(
                      leading: Icon(Icons.person, size: 20),
                      title: Text(
                        'John Doe',
                        style: ui.typography.textSm.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'john@example.com',
                        style: ui.typography.textSm.copyWith(
                          color: ui.colors.mutedForeground,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: ui.colors.mutedForeground,
                      ),
                    ),
                    UiListItem(
                      leading: Icon(Icons.person, size: 20),
                      title: Text(
                        'Jane Smith',
                        style: ui.typography.textSm.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'jane@example.com',
                        style: ui.typography.textSm.copyWith(
                          color: ui.colors.mutedForeground,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: ui.colors.mutedForeground,
                      ),
                    ),
                    UiListItem(
                      leading: Icon(Icons.person, size: 20),
                      title: Text(
                        'Bob Johnson',
                        style: ui.typography.textSm.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'bob@example.com',
                        style: ui.typography.textSm.copyWith(
                          color: ui.colors.mutedForeground,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: ui.colors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Combined example: Settings-like layout
          UiSection(
            title: 'Practical Example',
            description: 'Settings-style page layout',
            child: VStack(
              gap: UiSpacing.lg,
              children: [
                UiSection(
                  title: 'Account',
                  padding: UiSpacing.md,
                  backgroundColor: ui.colors.muted,
                  child: UiList(
                    children: [
                      UiListItem(
                        title: Text(
                          'Change Password',
                          style: ui.typography.textSm,
                        ),
                        subtitle: Text(
                          'Update your password',
                          style: ui.typography.textSm.copyWith(
                            color: ui.colors.mutedForeground,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: ui.colors.mutedForeground,
                        ),
                      ),
                      UiListItem(
                        title: Text(
                          'Two-Factor Auth',
                          style: ui.typography.textSm,
                        ),
                        subtitle: Text(
                          'Enable 2FA for extra security',
                          style: ui.typography.textSm.copyWith(
                            color: ui.colors.mutedForeground,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: ui.colors.mutedForeground,
                        ),
                      ),
                      UiListItem(
                        title: Text(
                          'Delete Account',
                          style: ui.typography.textSm.copyWith(
                            color: ui.colors.destructive,
                          ),
                        ),
                        subtitle: Text(
                          'Permanently delete your account',
                          style: ui.typography.textSm.copyWith(
                            color: ui.colors.mutedForeground,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: ui.colors.mutedForeground,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
