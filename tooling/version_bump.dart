#!/usr/bin/env dart

import 'dart:io';

/// Extracts version from CHANGELOG.md file
/// Assumes the first version line follows format: "## X.Y.Z"
String? extractVersionFromChangelog(String changelogPath) {
  try {
    final file = File(changelogPath);
    if (!file.existsSync()) return null;

    final content = file.readAsStringSync();
    final lines = content.split('\n');

    for (final line in lines) {
      final trimmed = line.trim();
      // Match "## X.Y.Z" or "## X.Y.Z-identifier"
      if (trimmed.startsWith('## ')) {
        final version = trimmed.substring(3).split(' ').first;
        return version;
      }
    }
  } catch (e) {
    print('Error reading changelog: $e');
  }
  return null;
}

/// Updates version in pubspec.yaml file
bool updatePubspecVersion(String pubspecPath, String newVersion) {
  try {
    final file = File(pubspecPath);
    if (!file.existsSync()) return false;

    final content = file.readAsStringSync();
    final updatedContent = content.replaceAll(
      RegExp(r'^version:\s+[\d.]+(?:-[\w.-]+)?', multiLine: true),
      'version: $newVersion',
    );

    if (content == updatedContent) {
      print('Version already up-to-date in $pubspecPath');
      return false;
    }

    file.writeAsStringSync(updatedContent);
    print('Updated version to $newVersion in $pubspecPath');
    return true;
  } catch (e) {
    print('Error updating pubspec: $e');
    return false;
  }
}

void main(List<String> args) {
  final workspaceRoot = args.isNotEmpty ? args[0] : '.';
  final packagesToUpdate = ['core', 'components'];

  bool anyUpdated = false;

  for (final package in packagesToUpdate) {
    final changelogPath = '$workspaceRoot/packages/$package/CHANGELOG.md';
    final pubspecPath = '$workspaceRoot/packages/$package/pubspec.yaml';

    final newVersion = extractVersionFromChangelog(changelogPath);

    if (newVersion == null) {
      print('Warning: Could not extract version from $changelogPath');
      continue;
    }

    final updated = updatePubspecVersion(pubspecPath, newVersion);
    if (updated) anyUpdated = true;
  }

  if (anyUpdated) {
    print('\n✓ Version bump completed');
    exit(0);
  } else {
    print('\nNo version updates needed');
    exit(0);
  }
}
