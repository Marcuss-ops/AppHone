import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_config.dart';
import '../../configs/generic_content_config.dart';
import '../../configs/christian_luce_config.dart';

final activeConfigProvider = Provider<AppConfig>((ref) {
  // Use environment variables or simple toggle to switch templates
  const template = String.fromEnvironment('APP_TEMPLATE', defaultValue: 'christian');
  
  switch (template) {
    case 'christian':
      return ChristianLuceConfig();
    case 'generic':
    default:
      return GenericContentConfig();
  }
});
