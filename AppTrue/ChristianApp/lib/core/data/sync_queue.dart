import 'package:flutter_riverpod/flutter_riverpod.dart';

// Generic Repository Contract
abstract class Repository<T> {
  Future<T> getLocal(String id);
  Future<T> getRemote(String id);
  Stream<T> watch(String id);
  Future<void> save(T item);
}

// SyncTask representing a mutation that needs to be synced
class SyncTask {
  final String id;
  final String action; // e.g., 'update_xp', 'add_interaction'
  final Map<String, dynamic> payload;
  final DateTime createdAt;
  int retryCount;

  SyncTask({
    required this.id,
    required this.action,
    required this.payload,
    DateTime? createdAt,
    this.retryCount = 0,
  }) : createdAt = createdAt ?? DateTime.now();
}

// Persists and retries mutations when online
class SyncQueue {
  final List<SyncTask> _queue = [];
  bool _isProcessing = false;

  Future<void> addTask(SyncTask task) async {
    _queue.add(task);
    // In production: save to SQLite/Drift here
    _processQueue();
  }

  Future<void> _processQueue() async {
    if (_isProcessing || _queue.isEmpty) return;
    _isProcessing = true;

    while (_queue.isNotEmpty) {
      final task = _queue.first;
      try {
        await _syncWithRemote(task);
        _queue.removeAt(0);
      } catch (e) {
        task.retryCount++;
        if (task.retryCount > 5) _queue.removeAt(0); // Give up or move to dead letter
        break; // Stop processing and wait for next trigger/connectivity change
      }
    }

    _isProcessing = false;
  }

  Future<void> _syncWithRemote(SyncTask task) async {
    // Logic to call Supabase or other API based on task.action
    await Future.delayed(const Duration(seconds: 1)); // Simulated network call
  }
}

final syncQueueProvider = Provider((ref) => SyncQueue());
