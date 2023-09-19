import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_flutter_state/pages/useFuture_page.dart';
import 'package:hooks_flutter_state/pages/useListenable_page.dart';
import 'package:hooks_flutter_state/pages/useScrollController_page.dart';
import 'package:hooks_flutter_state/pages/useState_page.dart';
import 'package:hooks_flutter_state/pages/useStreamController_page.dart';
import 'package:hooks_flutter_state/pages/useStream_page.dart';

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
          seedColor: Colors.yellowAccent,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyMedium: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          labelLarge: const TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/useStream-page': (context) => const UseStreamPage(),
        '/useState-page': (context) => const UseStatePage(),
        '/useFuture-page': (context) => const UseFuturePage(),
        '/useListenable-page': (context) => const UseListenablePage(),
        '/useScrollController-page': (context) =>
            const UseScrollControllerPage(),
        '/useStreamController-page': (context) =>
            const UseStreamControllerPage()
      },
    );
  }
}

class HomePage extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useStream-page');
              },
              child: const Text('UseStream Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useState-page');
              },
              child: const Text('UseState Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useFuture-page');
              },
              child: const Text('UseFuture Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useListenable-page');
              },
              child: const Text('UseListenable Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useScrollController-page');
              },
              child: const Text('UseScrollController Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useStreamController-page');
              },
              child: const Text('UseStreamController Page'),
            ),
          ],
        ),
      ),
    );
  }
}
