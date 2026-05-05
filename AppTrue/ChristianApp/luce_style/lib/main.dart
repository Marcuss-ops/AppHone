
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('it_IT', null);
  runApp(const LuceApp());
}

class LuceApp extends StatelessWidget {
  const LuceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAF7F2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E2A44),
          primary: const Color(0xFF1E2A44),
          secondary: const Color(0xFFC9A86A),
        ),
        useMaterial3: true,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF1E2A44)),
          bodyLarge: TextStyle(height: 1.5),
        ),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int idx = 0;
  final pages = const [HomeTab(), BibbiaTab(), PreghieraTab(), CalendarioTab(), DiarioTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[idx]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: idx,
        onDestinationSelected: (i) => setState(() => idx = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Bibbia'),
          NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Preghiera'),
          NavigationDestination(icon: Icon(Icons.calendar_today_outlined), selectedIcon: Icon(Icons.calendar_today), label: 'Calendario'),
          NavigationDestination(icon: Icon(Icons.edit_note_outlined), selectedIcon: Icon(Icons.edit_note), label: 'Diario'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    final oggi = DateFormat('EEEE d MMMM', 'it_IT').format(DateTime.now());
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Buongiorno', style: Theme.of(context).textTheme.headlineMedium),
        Text(oggi, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 20),
        _Card(
          title: 'Versetto del giorno',
          subtitle: 'Giovanni 8:12',
          child: const Text('"Io sono la luce del mondo; chi segue me, non camminerà nelle tenebre, ma avrà la luce della vita."',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          actions: [
            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.play_arrow), label: const Text('Ascolta')),
            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.share), label: const Text('Condividi')),
          ],
        ),
        _Card(
          title: 'Preghiera del mattino',
          child: const Text('Signore, apri le mie labbra e la mia bocca proclami la tua lode. Guida i miei passi oggi a Gaeta e ovunque andrò.'),
        ),
        _Card(
          title: 'Santo del giorno',
          subtitle: 'San Floriano',
          child: const Text('Martire, patrono dei vigili del fuoco. Prega per noi.'),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _Quick('Rosario', Icons.circle_outlined),
            _Quick('Lectio', Icons.auto_stories),
            _Quick('Esame', Icons.nightlight),
          ],
        )
      ],
    );
  }
}

class BibbiaTab extends StatelessWidget {
  const BibbiaTab({super.key});
  final libri = const ['Genesi','Salmi','Isaia','Matteo','Marco','Luca','Giovanni','Atti','Romani','Apocalisse'];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Bibbia', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        TextField(decoration: InputDecoration(hintText: 'Cerca passo', prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: Colors.white)),
        const SizedBox(height: 20),
        ...libri.map((l) => Card(child: ListTile(title: Text(l), trailing: const Icon(Icons.chevron_right), onTap: () {
          if (l=='Giovanni') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const LetturaPage()));
          }
        }))),
      ],
    );
  }
}

class LetturaPage extends StatelessWidget {
  const LetturaPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giovanni 1')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text('1 In principio era il Verbo, e il Verbo era presso Dio e il Verbo era Dio.'),
          SizedBox(height: 8),
          Text('4 In lui era la vita e la vita era la luce degli uomini.'),
          SizedBox(height: 8),
          Text('5 La luce splende nelle tenebre e le tenebre non l’hanno vinta.'),
        ],
      ),
    );
  }
}

class PreghieraTab extends StatelessWidget {
  const PreghieraTab({super.key});
  @override
  Widget build(BuildContext context) {
    final cats = {
      'Mattino': 'Ti adoro, mio Dio...',
      'Sera': 'Ti ringrazio, Signore...',
      'Famiglia': 'Benedici la nostra casa...',
      'Difficoltà': 'Nel momento della prova...'
    };
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Preghiere', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        ...cats.entries.map((e) => Card(
          child: ExpansionTile(title: Text(e.key), children: [Padding(padding: const EdgeInsets.all(16), child: Text(e.value))]),
        ))
      ],
    );
  }
}

class CalendarioTab extends StatelessWidget {
  const CalendarioTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Calendario liturgico', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        const Text('Maggio 2026 – Tempo Pasquale'),
        const SizedBox(height: 12),
        _Card(title: '4 maggio', subtitle: 'Lunedì', child: const Text('S. Floriano – Feria pasquale')),
        _Card(title: '8 maggio', subtitle: 'Giovedì', child: const Text('Ascensione del Signore (solennità)')),
        _Card(title: '18 maggio', subtitle: 'Domenica', child: const Text('Pentecoste')),
      ],
    );
  }
}

class DiarioTab extends StatefulWidget {
  const DiarioTab({super.key});
  @override
  State<DiarioTab> createState() => _DiarioTabState();
}

class _DiarioTabState extends State<DiarioTab> {
  final ctrl = TextEditingController();
  String saved = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final p = await SharedPreferences.getInstance();
    setState(() => saved = p.getString('diario_oggi') ?? '');
    ctrl.text = saved;
  }

  Future<void> _save() async {
    final p = await SharedPreferences.getInstance();
    await p.setString('diario_oggi', ctrl.text);
    setState(() => saved = ctrl.text);
    if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Salvato in locale')));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Diario spirituale', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        const Text('Cosa ti ha parlato oggi il Signore?'),
        const SizedBox(height: 12),
        TextField(controller: ctrl, maxLines: 8, decoration: InputDecoration(hintText: 'Scrivi qui...', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
        const SizedBox(height: 12),
        FilledButton.icon(onPressed: _save, icon: const Icon(Icons.save), label: const Text('Salva')),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final List<Widget>? actions;
  const _Card({required this.title, this.subtitle, required this.child, this.actions});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          if (subtitle != null) Text(subtitle!, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          child,
          if (actions != null) Row(children: actions!),
        ]),
      ),
    );
  }
}

class _Quick extends StatelessWidget {
  final String label;
  final IconData icon;
  const _Quick(this.label, this.icon);
  @override
  Widget build(BuildContext context) {
    return ActionChip(label: Text(label), avatar: Icon(icon, size: 18), onPressed: () {});
  }
}
