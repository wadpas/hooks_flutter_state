import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_flutter_state/pages/useState_page.dart';
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
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
      routes: {
        '/useStream-page': (context) => const UseStreamPage(),
        '/useState-page': (context) => const UseStatePage(),
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
