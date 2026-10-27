import 'package:flutter_test/flutter_test.dart';
import 'package:skelphone/brand_config.dart';
import 'package:skelphone/configs/christian_luce_config.dart';

void main() {
  group('Configuration Tests', () {
    test('BrandConfig should have correct initial values', () {
      expect(BrandConfig.appName, 'Luce');
      expect(BrandConfig.channelSlug, 'christian_luce');
    });

    test('ChristianLuceConfig should have correct sections', () {
      final config = ChristianLuceConfig();
      expect(config.homeSections, isNotEmpty);
      expect(config.homeSections.first.id, anyOf('calendar', 'featured', 'inspiration'));
    });
  });
}
