import 'dart:convert';
import 'dart:io';

void main() async {
  final enFile = File('assets/translations/en.json');
  final frFile = File('assets/translations/fr.json');

  if (!enFile.existsSync() || !frFile.existsSync()) {
    print('❌ Error: Translation files not found.');
    exit(1);
  }

  final enData = json.decode(await enFile.readAsString()) as Map<String, dynamic>;
  final frData = json.decode(await frFile.readAsString()) as Map<String, dynamic>;

  bool hasErrors = false;

  print('🔍 Validating translations...');

  hasErrors |= _compareKeys(enData, frData, 'en', 'fr');
  hasErrors |= _compareKeys(frData, enData, 'fr', 'en');
  hasErrors |= _checkValues(enData, 'en');
  hasErrors |= _checkValues(frData, 'fr');

  if (hasErrors) {
    print('\n❌ Translation validation failed.');
    exit(1);
  } else {
    print('\n✅ All translations are valid!');
    exit(0);
  }
}

bool _compareKeys(
  Map<String, dynamic> source,
  Map<String, dynamic> target,
  String sourceName,
  String targetName, [
  String path = '',
]) {
  bool hasErrors = false;

  source.forEach((key, value) {
    final currentPath = path.isEmpty ? key : '$path.$key';

    if (!target.containsKey(key)) {
      print('⚠️ Missing key in $targetName: "$currentPath" (present in $sourceName)');
      hasErrors = true;
    } else if (value is Map<String, dynamic> && target[key] is Map<String, dynamic>) {
      hasErrors |= _compareKeys(value, target[key] as Map<String, dynamic>, sourceName, targetName, currentPath);
    }
  });

  return hasErrors;
}

bool _checkValues(Map<String, dynamic> data, String fileName, [String path = '']) {
  bool hasErrors = false;

  data.forEach((key, value) {
    final currentPath = path.isEmpty ? key : '$path.$key';

    if (value == null) {
      print('❌ Null value in $fileName: "$currentPath"');
      hasErrors = true;
    } else if (value is String && value.trim().isEmpty) {
      print('❌ Empty value in $fileName: "$currentPath"');
      hasErrors = true;
    } else if (value is Map<String, dynamic>) {
      hasErrors |= _checkValues(value, fileName, currentPath);
    }
  });

  return hasErrors;
}
