import '../core/config/app_config.dart';

class SleepyCopy implements AppCopy {
  @override String get errorGeneric => 'Si è verificato un errore';
  @override String get buttonRetry => 'Riprova';
  @override String get buttonCancel => 'Annulla';

  @override String get onboardingTitle => 'Sleepy';
  @override String get onboardingSubtitle => 'Il tuo riposo profondo inizia qui.';
  @override String get onboardingButton => 'Inizia';

  @override String get homeGreeting => 'Buonanotte';
  @override String get homeSubtitle => 'Pronto per un sonno rigenerante?';
  @override String get homeJourneyTitle => 'Percorso del sonno';
  @override String get homeJourneyInviteAction => 'Invita un amico a rilassarsi';
  @override String get homeGuidedTitle => 'Momento di Relax';
  @override String get homeGuidedSubtitle => 'Respirazione • Rumori Bianchi • Meditazione';
  @override String get homeFriendsPrayedPill => '1.240 persone si stanno rilassando ora';
  @override String get homeListenTogetherAction => 'Ascolta ora →';
  @override String get homeWrappedTitle => 'IL TUO ANNO DI RIPOSO';
  @override String get homeWrappedAction => 'VEDI IL TUO REPORT';
  @override String get homeQuickPracticesTitle => 'Rilassamento rapido';

  @override String get communityTitle => 'Sleepy Community';
  @override String get communitySubtitle => 'Condividi la tua pace e trova il tuo equilibrio.';
  @override String get communityRoomsTitle => 'STANZE DI RELAX';
  @override String get communityCreateRoomAction => '+ NUOVA STANZA';
  @override String get communityRecentIntentsTitle => 'PENSIERI DELLA SERA';
  @override String get communityInputPlaceholder => 'Cosa ti ha rilassato oggi?';
  @override String get communityPostAction => 'Condividi Pace';
  @override String get communitySupportAction => 'Sostieni';
  @override String get communityLiveCountContacts => '5 tuoi amici +';
  @override String get communityLiveCountOthers => '15.000 altri stanno dormendo bene';
  @override String get communityPrayerTitle => 'Rilassiamoci insieme';
  @override String get communityPrayerAction => 'Sono Rilassato';
  @override String get communityInviteWhatsApp => 'Invita su WhatsApp';
  @override String get communityLightCandleAction => 'Spegni le luci';
  @override String get communityCandleLitFeedback => 'Luci soffuse impostate';

  @override String get referralUnlockTitle => 'Sblocca suoni premium';
  @override String get referralUnlockSubtitle => 'Invita 3 amici o passa a Premium per sbloccare la foresta pluviale.';
  @override String get referralInviteAction => 'Invita 3 amici e sblocca';
  @override String get referralPremiumAction => 'Passa a Premium';
  @override String get referralProgressTemplate => '{current}/{target} amici invitati';

  @override String get playerContinueWatching => 'CONTINUA L\'ASCOLTO';
  @override String get playerCompletedTitle => 'Sogni d\'oro';
  @override String get playerCompletedSubtitle => 'Vuoi condividere questa melodia?';
  @override String get playerShareWhatsApp => 'Invia su WhatsApp';
  @override String get playerCreateVerseImage => 'Crea immagine relax';
}
