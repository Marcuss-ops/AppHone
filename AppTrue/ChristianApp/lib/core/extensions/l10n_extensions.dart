import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on AppLocalizations {
  String getByKey(String key) {
    switch (key) {
      case 'homeGreeting': return homeGreeting;
      case 'homeSubtitle': return homeSubtitle;
      case 'featuredCategory': return featuredCategory;
      case 'latestCategory': return latestCategory;
      case 'premiumBadge': return premiumBadge;
      case 'freeBadge': return freeBadge;
      default: return key;
    }
  }
}
