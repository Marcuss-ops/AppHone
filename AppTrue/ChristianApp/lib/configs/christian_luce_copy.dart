import 'package:flutter/material.dart';
import '../core/config/app_config.dart';

class ChristianLuceCopy implements AppCopy {
  @override String get errorGeneric => 'Si è verificato un errore';
  @override String get buttonRetry => 'Riprova';
  @override String get buttonCancel => 'Annulla';

  @override String get onboardingTitle => 'Luce';
  @override String get onboardingSubtitle => 'Il tuo cammino di preghiera quotidiano.';
  @override String get onboardingButton => 'Inizia';

  @override String get homeGreeting => 'Buongiorno';
  @override String get homeSubtitle => 'La tua anima è pronta';
  @override String get homeGuidedTitle => 'Il tuo momento di Luce';
  @override String get homeGuidedSubtitle => 'Versetto • Riflessione • Preghiera';
  @override String get homeWrappedTitle => 'IL TUO ANNO IN PREGHIERA';
  @override String get homeWrappedAction => 'CONDIVIDI IL TUO PERCORSO';

  @override String get communityTitle => 'Community Support';
  @override String get communitySubtitle => 'Insieme nella preghiera e nel sostegno reciproco.';
  @override String get communityRoomsTitle => 'STANZE DI PREGHIERA';
  @override String get communityCreateRoomAction => '+ CREA STANZA';
  @override String get communityRecentIntentsTitle => 'INTENZIONI RECENTI';
  @override String get communityInputPlaceholder => 'Per cosa vuoi essere sostenuto oggi?';
  @override String get communityPostAction => 'Chiedi Sostegno';
  @override String get communitySupportAction => 'Sostieni';
  @override String get communityLiveCountTemplate => 'persone stanno pregando ora';
  @override String get communityPrayerTitle => 'Preghiamo insieme';
  @override String get communityPrayerAction => 'Ho Pregato';

  @override String get playerContinueWatching => 'CONTINUA A GUARDARE';
}
