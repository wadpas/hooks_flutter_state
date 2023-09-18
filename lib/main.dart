import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_flutter_state/pages/seconds_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hooks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
      routes: {
        '/seconds-page': (context) => const SecondsPage(),
      },
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hooks'),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/seconds-page');
              },
              child: const Text('Seconds Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/inherited-notifier');
              },
              child: const Text('Inherited Notifier'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/inherited-widget');
              },
              child: const Text('Inherited Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
