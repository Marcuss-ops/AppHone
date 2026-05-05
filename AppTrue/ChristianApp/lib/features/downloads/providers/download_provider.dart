import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DownloadStatus { notDownloaded, downloading, downloaded, error }

class DownloadState {
  final DownloadStatus status;
  final double progress;
  final String? localPath;

  const DownloadState({
    this.status = DownloadStatus.notDownloaded,
    this.progress = 0.0,
    this.localPath,
  });

  DownloadState copyWith({
    DownloadStatus? status,
    double? progress,
    String? localPath,
  }) {
    return DownloadState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
      localPath: localPath ?? this.localPath,
    );
  }
}

class DownloadNotifier extends FamilyNotifier<DownloadState, String> {
  @override
  DownloadState build(String arg) {
    return const DownloadState();
  }

  Future<void> startDownload(String url) async {
    state = state.copyWith(status: DownloadStatus.downloading, progress: 0.0);
    
    // Simulate downloading
    for (int i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      state = state.copyWith(progress: i / 10);
    }

    state = state.copyWith(
      status: DownloadStatus.downloaded,
      localPath: '/mock/path/to/file.mp3',
    );
  }

  Future<void> removeDownload() async {
    state = const DownloadState();
  }
}

final downloadProvider = NotifierProvider.family<DownloadNotifier, DownloadState, String>(() {
  return DownloadNotifier();
});
