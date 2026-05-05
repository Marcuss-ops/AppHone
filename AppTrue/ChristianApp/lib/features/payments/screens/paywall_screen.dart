import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../brand_config.dart';
import '../../../core/config/active_config.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(activeConfigProvider);
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(Icons.lock_open, color: BrandConfig.secondaryColor, size: 64),
              const SizedBox(height: 24),
              Text(
                'Sblocca ${config.appName} Premium',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Accesso illimitato a tutti i contenuti, corsi completi e audio offline.',
                textAlign: TextAlign.center,
                style: TextStyle(color: BrandConfig.textSecondary),
              ),
              const SizedBox(height: 32),
              _feature('Tutti i contenuti premium sbloccati'),
              _feature('Corsi completi con certificato'),
              _feature('Audio offline'),
              _feature('Senza pubblicità'),
              _feature('${config.trialDays} giorni gratis'),
              const Spacer(),
              ElevatedButton(
                onPressed: () => context.push('/pricing'),
                child: const Text('Vedi i piani'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.pop(),
                child: Text('Continua gratuitamente',
                    style: TextStyle(color: BrandConfig.textSecondary)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _feature(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        const Icon(Icons.check_circle, color: BrandConfig.secondaryColor, size: 20),
        const SizedBox(width: 12),
        Text(text),
      ],
    ),
  );
}
