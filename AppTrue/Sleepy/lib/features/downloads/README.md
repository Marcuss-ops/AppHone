# Download Manager ⬇️

A modular system to handle offline content availability.

## Architecture

- **`DownloadStatus`:** Tracks if a file is `notDownloaded`, `downloading`, `downloaded`, or has an `error`.
- **`DownloadNotifier`:** A Riverpod family notifier that manages the state of a specific content ID.
- **Mocking:** The skeleton includes a simulated download loop to test UI progress bars and state transitions without real network overhead.

## Implementation Guide

To implement real downloads:
1. Replace the simulated loop in `DownloadNotifier` with `dio.download()`.
2. Use `path_provider` to find the local storage directory.
3. Update the `MiniPlayer` to check the local path before attempting to stream.

## Why it's in the skeleton

Offline access is a primary "Premium" feature. Providing the state management skeleton ensures you can easily add this value proposition to any content brand.
