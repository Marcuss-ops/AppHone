import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_config.dart';
import '../../configs/generic_content_config.dart';
import '../../configs/christian_luce_config.dart';
import '../../configs/sleepy_config.dart';

final activeConfigProvider = Provider<AppConfig>((ref) {
  // Use environment variables or simple toggle to switch templates
  const template = String.fromEnvironment('APP_TEMPLATE', defaultValue: 'sleepy');
  
  switch (template) {
    case 'sleepy':
      return SleepyConfig();
    case 'christian':
      return ChristianLuceConfig();
    case 'generic':
    default:
      return GenericContentConfig();
  }
});
