import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/onboarding_step.dart';
import '../../../brand_config.dart';
import '../../../core/theme/design_system.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  final List<OnboardingStep> steps;
  final VoidCallback onCompleted;

  const OnboardingScreen({
    super.key,
    required this.steps,
    required this.onCompleted,
  });

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final Map<String, List<String>> _answers = {};

  void _nextPage() {
    if (_currentIndex < widget.steps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandConfig.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            Padding(
              padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / widget.steps.length,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(BrandConfig.primaryColor),
                borderRadius: BorderRadius.circular(10),
                minHeight: 8,
              ),
            ),
            
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemCount: widget.steps.length,
                itemBuilder: (context, index) {
                  final step = widget.steps[index];
                  return _buildStep(step);
                },
              ),
            ),

            // Navigation Button
            Padding(
              padding: const EdgeInsets.all(AppDesignSystem.spacingMD),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _answers[widget.steps[_currentIndex].id]?.isNotEmpty == true 
                    ? _nextPage 
                    : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BrandConfig.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    _currentIndex == widget.steps.length - 1 ? 'FINISH' : 'CONTINUE',
                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(OnboardingStep step) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDesignSystem.spacingMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Text(
            step.question,
            style: AppDesignSystem.h1.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 40),
          ...step.options.map((option) {
            final isSelected = _answers[step.id]?.contains(option) ?? false;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (step.multiSelect) {
                      final current = _answers[step.id] ?? [];
                      if (current.contains(option)) {
                        current.remove(option);
                      } else {
                        current.add(option);
                      }
                      _answers[step.id] = current;
                    } else {
                      _answers[step.id] = [option];
                      _nextPage();
                    }
                  });
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(
                    color: isSelected ? BrandConfig.primaryColor.withValues(alpha: 0.1) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? BrandConfig.primaryColor : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                            color: isSelected ? BrandConfig.primaryColor : BrandConfig.textPrimary,
                          ),
                        ),
                      ),
                      if (isSelected)
                        const Icon(Icons.check_circle, color: BrandConfig.primaryColor),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
