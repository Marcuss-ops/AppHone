import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glossy/glossy.dart';
import '../../core/theme/app_colors.dart';
import 'bible_reader.dart';

class BibbiaTab extends StatelessWidget {
  const BibbiaTab({super.key});
  @override
  Widget build(BuildContext context) {
    final libri = ['Genesi','Salmi','Isaia','Matteo','Marco','Luca','Giovanni','Atti','Romani','Apocalisse'];
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
        children: [
          Text('Bibbia', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cerca passo',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: libri.map((l) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(context, MaterialPageRoute(builder: (_) => BibleReaderScreen(bookName: l)));
                  },
                  child: GlossyContainer(
                    height: 60, width: constraints.maxWidth,
                    strengthX: 14, strengthY: 14, opacity: 0.05, borderRadius: BorderRadius.circular(12),
                    child: ListTile(
                      leading: Hero(
                        tag: 'bible_book_$l',
                        child: Material(
                          color: Colors.transparent,
                          child: Text(l[0], style: GoogleFonts.cormorantGaramond(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryAccent)),
                        ),
                      ),
                      title: Text(l, style: GoogleFonts.inter()), 
                      trailing: const Icon(Icons.chevron_right, color: Colors.white54)
                    ),
                  ),
                ),
              )).toList(),
            );
          }),
        ],
      ),
    );
  }
}
