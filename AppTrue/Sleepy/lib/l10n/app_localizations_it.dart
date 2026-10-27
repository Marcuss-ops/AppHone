// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get homeGreeting => 'Bentornato,';

  @override
  String get homeSubtitle => 'Esplora i tuoi contenuti';

  @override
  String get featuredCategory => 'In Evidenza';

  @override
  String get latestCategory => 'Ultimi Contenuti';

  @override
  String get premiumBadge => 'PREMIUM';

  @override
  String get freeBadge => 'GRATIS';
}
