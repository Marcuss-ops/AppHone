import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/inspiration.dart';

part 'inspiration_provider.g.dart';

@riverpod
class DailyInspiration extends _$DailyInspiration {
  @override
  Future<Inspiration> build() async {
    // Simulated fetch from API/Supabase
    await Future.delayed(const Duration(milliseconds: 500));
    
    return const Inspiration(
      id: 'daily_1',
      content: 'Non temere, perché io sono con te; non smarrirti, perché io sono il tuo Dio. Ti rendo forte e ti vengo in aiuto.',
      source: 'Isaia 41:10',
      tags: ['forza', 'fede', 'conforto'],
    );
  }
}
