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
  @override String get homeJourneyTitle => 'Cammino di gruppo';
  @override String get homeJourneyInviteAction => 'Invita qualcuno per riempirlo';
  @override String get homeGuidedTitle => 'Il tuo momento di Luce';
  @override String get homeGuidedSubtitle => 'Versetto • Riflessione • Preghiera';
  @override String get homeFriendsPrayedPill => '2 amici hanno pregato oggi – invita il terzo';
  @override String get homeListenTogetherAction => 'Ascolta insieme →';
  @override String get homeWrappedTitle => 'IL TUO ANNO IN PREGHIERA';
  @override String get homeWrappedAction => 'CONDIVIDI IL TUO PERCORSO';
  @override String get homeQuickPracticesTitle => 'Pratiche rapide';

  @override String get communityTitle => 'Community Support';
  @override String get communitySubtitle => 'Insieme nella preghiera e nel sostegno reciproco.';
  @override String get communityRoomsTitle => 'STANZE DI PREGHIERA';
  @override String get communityCreateRoomAction => '+ CREA STANZA';
  @override String get communityRecentIntentsTitle => 'INTENZIONI RECENTI';
  @override String get communityInputPlaceholder => 'Per cosa vuoi essere sostenuto oggi?';
  @override String get communityPostAction => 'Chiedi Sostegno';
  @override String get communitySupportAction => 'Sostieni';
  @override String get communityLiveCountContacts => '3 tuoi contatti +';
  @override String get communityLiveCountOthers => '12.429 altri stanno pregando ora';
  @override String get communityPrayerTitle => 'Preghiamo insieme';
  @override String get communityPrayerAction => 'Ho Pregato';
  @override String get communityInviteWhatsApp => 'Invita su WhatsApp';

  @override String get playerContinueWatching => 'CONTINUA A GUARDARE';
  @override String get playerCompletedTitle => 'Hai completato';
  @override String get playerCompletedSubtitle => 'Con chi vuoi condividere questa pace?';
  @override String get playerShareWhatsApp => 'Invia su WhatsApp';
  @override String get playerCreateVerseImage => 'Crea immagine versetto';
}
