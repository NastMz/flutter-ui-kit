import 'dart:convert';
import 'dart:io';

const manifestPath = 'docs/shadcn_parity_manifest.json';
const policyPath = 'docs/component-policy.md';
const tokenSection = 'token-mapping';
const componentSection = 'component-coverage';

const statusSymbols = {'done': '✅', 'in-progress': '⚙️', 'todo': '☐'};

void main(List<String> args) {
  final manifestFile = File(manifestPath);
  if (!manifestFile.existsSync()) {
    stderr.writeln('Manifest not found at $manifestPath');
    exitCode = 1;
    return;
  }

  final policyFile = File(policyPath);
  if (!policyFile.existsSync()) {
    stderr.writeln('Policy doc not found at $policyPath');
    exitCode = 1;
    return;
  }

  final manifest =
      jsonDecode(manifestFile.readAsStringSync()) as Map<String, dynamic>;
  final tokens = (manifest['tokens'] as List<dynamic>? ?? [])
      .cast<Map<String, dynamic>>();
  final components = (manifest['components'] as List<dynamic>? ?? [])
      .cast<Map<String, dynamic>>();

  final updatedContent = _replaceSection(
    _replaceSection(
      policyFile.readAsStringSync(),
      tokenSection,
      _buildTokenTable(tokens),
    ),
    componentSection,
    _buildComponentTable(components),
  );

  policyFile.writeAsStringSync(
    updatedContent,
    mode: FileMode.write,
    encoding: utf8,
  );
}

String _buildTokenTable(List<Map<String, dynamic>> tokens) {
  final buffer = StringBuffer()
    ..writeln('| shadcn token | Ui token | Status | Notes |')
    ..writeln('| --- | --- | --- | --- |');

  final sorted = [...tokens]
    ..sort((a, b) => (a['id'] as String).compareTo(b['id'] as String));

  for (final token in sorted) {
    final id = token['id'] as String? ?? '';
    final uiToken = _formatValue(token['uiToken'] as String?);
    final statusKey =
        (token['status'] as String?)?.trim().toLowerCase() ?? 'todo';
    final status = statusSymbols[statusKey] ?? '☐';
    final notes = _formatValue(token['notes'] as String?);
    buffer.writeln('| `$id` | $uiToken | $status | $notes |');
  }

  return buffer.toString().trim();
}

String _buildComponentTable(List<Map<String, dynamic>> components) {
  final buffer = StringBuffer()
    ..writeln('| Component | Flutter widget | Status | Notes |')
    ..writeln('| --- | --- | --- | --- |');

  final sorted = [...components]
    ..sort((a, b) => (a['id'] as String).compareTo(b['id'] as String));

  for (final component in sorted) {
    final id = _capitalized(component['id'] as String? ?? '');
    final widget = _formatValue(component['widget'] as String?);
    final statusKey =
        (component['status'] as String?)?.trim().toLowerCase() ?? 'todo';
    final status = statusSymbols[statusKey] ?? '☐';
    final notes = _formatValue(component['notes'] as String?);
    buffer.writeln('| $id | $widget | $status | $notes |');
  }

  return buffer.toString().trim();
}

String _replaceSection(String content, String sectionName, String replacement) {
  final startMarker = '<!-- BEGIN:$sectionName -->';
  final endMarker = '<!-- END:$sectionName -->';

  final startIndex = content.indexOf(startMarker);
  final endIndex = content.indexOf(endMarker);

  if (startIndex == -1 || endIndex == -1 || endIndex < startIndex) {
    throw StateError('Section markers for $sectionName not found');
  }

  final before = content.substring(0, startIndex + startMarker.length);
  final after = content.substring(endIndex);

  return '$before\n\n$replacement\n\n$after';
}

String _formatValue(String? value) {
  return value == null || value.trim().isEmpty ? '_TODO_' : value;
}

String _capitalized(String value) {
  if (value.isEmpty) {
    return value;
  }
  return value[0].toUpperCase() + value.substring(1);
}
