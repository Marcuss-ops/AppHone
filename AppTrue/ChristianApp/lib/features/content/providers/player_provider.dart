import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/models/content_item.dart';

part 'player_provider.g.dart';

@riverpod
class CurrentlyPlaying extends _$CurrentlyPlaying {
  @override
  ContentItem? build() => null;

  void play(ContentItem item) => state = item;
  void clear() => state = null;
}

typedef PlayerStateData = ({
  bool isPlaying,
  bool isLoading,
  Duration position,
  Duration? duration,
});

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  late final AudioPlayer _player;

  AudioPlayer get player => _player;

  @override
  PlayerStateData build() {
    _player = AudioPlayer();
    ref.onDispose(_player.dispose);
    return (
      isPlaying: false,
      isLoading: false,
      position: Duration.zero,
      duration: null,
    );
  }

  Future<void> playContent(ContentItem item) async {
    if (item.audioUrl == null) return;

    state = (isPlaying: false, isLoading: true, position: Duration.zero, duration: null);

    try {
      await _player.setUrl(item.audioUrl!);
      await _player.play();

      _player.playingStream.listen((playing) {
        state = (
          isPlaying: playing,
          isLoading: false,
          position: state.position,
          duration: _player.duration,
        );
      });

      _player.positionStream.listen((pos) {
        state = (
          isPlaying: state.isPlaying,
          isLoading: false,
          position: pos,
          duration: _player.duration,
        );
      });
    } catch (_) {
      state = (isPlaying: false, isLoading: false, position: Duration.zero, duration: null);
    }
  }

  Future<void> togglePlayPause() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> seekTo(Duration position) => _player.seek(position);

  Future<void> stop() async {
    await _player.stop();
    state = (isPlaying: false, isLoading: false, position: Duration.zero, duration: null);
  }
}
