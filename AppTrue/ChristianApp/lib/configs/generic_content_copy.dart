import 'package:flutter/material.dart';
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
  @override String get homeGuidedTitle => 'Your Daily Momentum';
  @override String get homeGuidedSubtitle => 'Insight • Video • Support';
  @override String get homeWrappedTitle => 'YOUR YEAR IN REVIEW';
  @override String get homeWrappedAction => 'SHARE YOUR JOURNEY';

  @override String get communityTitle => 'Community';
  @override String get communitySubtitle => 'Support each other.';
  @override String get communityRoomsTitle => 'ROOMS';
  @override String get communityCreateRoomAction => '+ CREATE ROOM';
  @override String get communityRecentIntentsTitle => 'RECENT POSTS';
  @override String get communityInputPlaceholder => 'What\'s on your mind?';
  @override String get communityPostAction => 'Share';
  @override String get communitySupportAction => 'Support';
  @override String get communityLiveCountTemplate => 'active now';
  @override String get communityPrayerTitle => 'Collective Focus';
  @override String get communityPrayerAction => 'I am done';

  @override String get playerContinueWatching => 'CONTINUE WATCHING';
}
