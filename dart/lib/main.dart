import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'components/custom_app_bar.dart';

void main() {
  runApp(const ChuvaDart());
}

class ChuvaDart extends StatelessWidget {
  const ChuvaDart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: fromCssColor('#673AB7')),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white
        ),
      ),
      home: const Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime(2023, 11, 26);
  bool _clicked = false;

  void _changeDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chuva 💜 Flutter',
        subtitle: 'Programação',
         backgroundColor: fromCssColor('#456189')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Programação'),
            const Text('Nov'),
            const Text('2023'),
            OutlinedButton(
              onPressed: () {
                _changeDate(DateTime(2023, 11, 26));
              },
              child: Text(
                '26',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                _changeDate(DateTime(2023, 11, 28));
              },
              child: Text(
                '28',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            if (_currentDate.day == 26)
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _clicked = true;
                    });
                  },
                  child: const Text('Mesa redonda de 07:00 até 08:00')),
            if (_currentDate.day == 28)
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _clicked = true;
                    });
                  },
                  child: const Text('Palestra de 09:30 até 10:00')),
            if (_currentDate.day == 26 && _clicked)
              const Activity(),
          ],
        ),
      ),
    );
  }
}

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool _favorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          'Activity title',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Text('A Física dos Buracos Negros Supermassivos'),
        const Text('Mesa redonda'),
        const Text('Domingo 07:00h - 08:00h'),
        const Text('Sthepen William Hawking'),
        const Text('Maputo'),
        const Text('Astrofísica e Cosmologia'),
        ElevatedButton.icon(
          onPressed: () {
            setState(() {
              _favorited = !_favorited;
            });
          },
          icon: _favorited
              ? const Icon(Icons.star)
              : const Icon(Icons.star_outline),
          label: Text(
              _favorited ? 'Remover da sua agenda' : 'Adicionar à sua agenda'),
        )
      ]),
    );
  }
}
