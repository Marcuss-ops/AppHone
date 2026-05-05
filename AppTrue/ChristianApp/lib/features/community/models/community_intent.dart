import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_intent.freezed.dart';
part 'community_intent.g.dart';

@freezed
class CommunityIntent with _$CommunityIntent {
  const factory CommunityIntent({
    required String id,
    required String userId,
    required String userName,
    required String content,
    required DateTime createdAt,
    @Default(0) int supportCount,
    @Default(false) bool hasUserSupported,
  }) = _CommunityIntent;

  factory CommunityIntent.fromJson(Map<String, dynamic> json) => _$CommunityIntentFromJson(json);
}
