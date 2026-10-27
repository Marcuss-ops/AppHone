import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:glossy/glossy.dart';
import '../../core/theme/app_colors.dart';

class CalendarioTab extends StatefulWidget {
  const CalendarioTab({super.key});
  @override
  State<CalendarioTab> createState() => _CalendarioTabState();
}

class _CalendarioTabState extends State<CalendarioTab> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
        children: [
          Text('Calendario liturgico', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          GlossyContainer(
            height: 500,
            width: double.infinity,
            strengthX: 18,
            strengthY: 18,
            opacity: 0.06,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.primaryAccent.withOpacity(0.1)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: TableCalendar(
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _format,
                locale: 'it_IT',
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) => setState(() => _format = format),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.primaryAccent),
                  leftChevronIcon: const Icon(Icons.chevron_left, color: AppColors.primaryAccent),
                  rightChevronIcon: const Icon(Icons.chevron_right, color: AppColors.primaryAccent),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(color: AppColors.primaryAccent.withOpacity(0.2), shape: BoxShape.circle),
                  selectedDecoration: const BoxDecoration(color: AppColors.primaryAccent, shape: BoxShape.circle),
                  selectedTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  defaultTextStyle: const TextStyle(color: Colors.white70),
                  weekendTextStyle: const TextStyle(color: AppColors.textSecondary),
                  outsideDaysVisible: false,
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  weekendStyle: TextStyle(color: AppColors.primaryAccent, fontSize: 12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Eventi del giorno', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700)),
              TextButton(onPressed: () {}, child: const Text('Vedi tutti', style: TextStyle(color: AppColors.primaryAccent))),
            ],
          ),
          const SizedBox(height: 12),
          _liturgicalEvent('4 Maggio', 'San Floriano', 'Martire, Feria pasquale', PhosphorIcons.shieldCheck()),
          const SizedBox(height: 12),
          _liturgicalEvent('8 Maggio', 'Ascensione', 'Solennità del Signore', PhosphorIcons.cloudArrowUp()),
        ],
      ),
    );
  }

  Widget _liturgicalEvent(String d, String t, String s, IconData i) => GlossyContainer(
        height: 80,
        width: double.infinity,
        strengthX: 14,
        strengthY: 14,
        opacity: 0.05,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryAccent.withOpacity(0.08)),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.primaryAccent.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(i, size: 20, color: AppColors.primaryAccent),
          ),
          title: Text(t, style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16)),
          subtitle: Text(s, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          trailing: Text(d, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primaryAccent)),
        ),
      );
}
