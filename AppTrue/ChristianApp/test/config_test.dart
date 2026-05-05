import 'package:flutter_test/flutter_test.dart';
import 'package:skelphone/brand_config.dart';
import 'package:skelphone/core/config/app_config.dart';

void main() {
  group('Configuration Tests', () {
    test('BrandConfig should have correct initial values', () {
      expect(BrandConfig.appName, 'SkelPhone');
      expect(BrandConfig.channelSlug, 'generic');
    });

    test('AppConfig should have mock data enabled by default for template', () {
      expect(AppConfig.useMockData, isTrue);
    });

    test('AppConfig home sections should not be empty', () {
      expect(AppConfig.homeSections, isNotEmpty);
      expect(AppConfig.homeSections.first.id, anyOf('featured', 'latest'));
    });
  });
}
