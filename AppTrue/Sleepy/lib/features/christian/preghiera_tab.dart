import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glossy/glossy.dart';

class PreghieraTab extends StatelessWidget {
  const PreghieraTab({super.key});
  @override
  Widget build(BuildContext context) {
    final items = {'Mattino':'Ti adoro, mio Dio...','Sera':'Ti ringrazio, Signore...','Famiglia':'Benedici la nostra casa...','Difficoltà':'Nel momento della prova...'};
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
        children: [
          Text('Preghiere', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: items.entries.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GlossyContainer(
                  height: 60, width: constraints.maxWidth,
                  strengthX: 16, strengthY: 16, opacity: 0.06, borderRadius: BorderRadius.circular(16),
                  child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text(e.key, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                      children: [Padding(padding: const EdgeInsets.fromLTRB(16,0,16,16), child: Text(e.value, style: const TextStyle(color: Color(0xFFE8E0D5))))],
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
