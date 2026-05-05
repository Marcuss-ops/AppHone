import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../core/theme/app_colors.dart';

class BibleReaderScreen extends StatelessWidget {
  final String bookName;

  const BibleReaderScreen({super.key, required this.bookName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundStart,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryAccent),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(PhosphorIcons.textAa(), color: AppColors.primaryAccent),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(PhosphorIcons.headphones(), color: AppColors.primaryAccent),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              title: Hero(
                tag: 'bible_book_$bookName',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    bookName,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryAccent,
                    ),
                  ),
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1E293B), AppColors.backgroundStart],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Capitolo 1',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'In principio Dio creò il cielo e la terra. La terra era informe e deserta e le tenebre ricoprivano l\'abisso e lo spirito di Dio aleggiava sulle acque.\n\nDio disse: «Sia la luce!». E la luce fu. Dio vide che la luce era cosa buona e Dio separò la luce dalle tenebre.\n\nDio chiamò la luce giorno, mentre chiamò le tenebre notte. E fu sera e fu mattina: giorno primo.',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: AppColors.textPrimary,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 100), // padding for bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
