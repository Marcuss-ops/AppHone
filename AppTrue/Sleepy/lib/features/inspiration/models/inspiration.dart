import 'package:freezed_annotation/freezed_annotation.dart';

part 'inspiration.freezed.dart';
part 'inspiration.g.dart';

@freezed
class Inspiration with _$Inspiration {
  const factory Inspiration({
    required String id,
    required String content,
    required String source, // e.g., "Giovanni 3:16" or "Marco Aurelio"
    String? imageUrl,
    String? audioUrl,
    @Default([]) List<String> tags,
  }) = _Inspiration;

  factory Inspiration.fromJson(Map<String, dynamic> json) => _$InspirationFromJson(json);
}
