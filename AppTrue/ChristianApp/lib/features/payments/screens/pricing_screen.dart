import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/payments_repository.dart';
import '../../../brand_config.dart';
import '../../../core/config/app_config.dart';

class PricingScreen extends ConsumerWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premium')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Scegli il tuo piano',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              '${AppConfig.trialDays} giorni gratis, poi scegli',
              textAlign: TextAlign.center,
              style: TextStyle(color: BrandConfig.textSecondary),
            ),
            const SizedBox(height: 32),
            _planCard(context, ref,
              name: 'Mensile',
              price: '€4,99/mese',
              planId: 'monthly',
              stripePriceId: AppConfig.stripePriceMonthly,
              isPopular: false,
            ),
            const SizedBox(height: 12),
            _planCard(context, ref,
              name: 'Annuale',
              price: '€39,99/anno',
              planId: 'yearly',
              stripePriceId: AppConfig.stripePriceYearly,
              isPopular: true,
              badge: 'Risparmia 33%',
            ),
            const SizedBox(height: 12),
            _planCard(context, ref,
              name: 'Accesso a vita',
              price: '€149,99',
              planId: 'lifetime',
              stripePriceId: AppConfig.stripePriceLifetime,
              isPopular: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _planCard(
    BuildContext context,
    WidgetRef ref, {
    required String name,
    required String price,
    required String planId,
    required String stripePriceId,
    required bool isPopular,
    String? badge,
  }) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: BrandConfig.surfaceColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isPopular
                  ? BrandConfig.secondaryColor
                  : BrandConfig.surfaceColor,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 4),
              Text(price,
                  style: TextStyle(color: BrandConfig.secondaryColor, fontSize: 16)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _checkout(context, ref, stripePriceId),
                child: Text('Scegli $name'),
              ),
            ],
          ),
        ),
        if (badge != null)
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: BrandConfig.secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(badge,
                  style: const TextStyle(
                    color: BrandConfig.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
      ],
    );
  }

  Future<void> _checkout(BuildContext context, WidgetRef ref, String priceId) async {
    try {
      final url = await ref.read(paymentsRepositoryProvider).createCheckoutSession(priceId);
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Errore: $e')),
        );
      }
    }
  }
}
