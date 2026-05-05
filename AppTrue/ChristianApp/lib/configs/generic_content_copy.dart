import '../core/config/app_config.dart';

class GenericContentCopy implements AppCopy {
  @override String get errorGeneric => 'An error occurred';
  @override String get buttonRetry => 'Retry';
  @override String get buttonCancel => 'Cancel';

  @override String get onboardingTitle => 'Generic App';
  @override String get onboardingSubtitle => 'Your personalized experience.';
  @override String get onboardingButton => 'Get Started';

  @override String get homeGreeting => 'Welcome';
  @override String get homeSubtitle => 'Your dashboard is ready';
  @override String get homeJourneyTitle => 'Group Journey';
  @override String get homeJourneyInviteAction => 'Invite someone to fill it';
  @override String get homeGuidedTitle => 'Your Daily Momentum';
  @override String get homeGuidedSubtitle => 'Insight • Video • Support';
  @override String get homeFriendsPrayedPill => '2 friends active today – invite more';
  @override String get homeListenTogetherAction => 'Listen together →';
  @override String get homeWrappedTitle => 'YOUR YEAR IN REVIEW';
  @override String get homeWrappedAction => 'SHARE YOUR JOURNEY';
  @override String get homeQuickPracticesTitle => 'Quick Actions';

  @override String get communityTitle => 'Community';
  @override String get communitySubtitle => 'Support each other.';
  @override String get communityRoomsTitle => 'ROOMS';
  @override String get communityCreateRoomAction => '+ CREATE ROOM';
  @override String get communityRecentIntentsTitle => 'RECENT POSTS';
  @override String get communityInputPlaceholder => 'What\'s on your mind?';
  @override String get communityPostAction => 'Share';
  @override String get communitySupportAction => 'Support';
  @override String get communityLiveCountContacts => '2 contacts +';
  @override String get communityLiveCountOthers => '1,200 others active now';
  @override String get communityPrayerTitle => 'Collective Focus';
  @override String get communityPrayerAction => 'I am done';
  @override String get communityInviteWhatsApp => 'Invite on WhatsApp';

  @override String get playerContinueWatching => 'CONTINUE WATCHING';
  @override String get playerCompletedTitle => 'Completed';
  @override String get playerCompletedSubtitle => 'Who do you want to share this with?';
  @override String get playerShareWhatsApp => 'Send on WhatsApp';
  @override String get playerCreateVerseImage => 'Create Shareable Image';
}
