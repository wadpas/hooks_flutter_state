import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_flutter_state/pages/useAppLifecycleState_page.dart';
import 'package:hooks_flutter_state/pages/useFuture_page.dart';
import 'package:hooks_flutter_state/pages/useListenable_page.dart';
import 'package:hooks_flutter_state/pages/useReducer_page.dart';
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
        '/useStream': (context) => const UseStreamPage(),
        '/useState': (context) => const UseStatePage(),
        '/useFuture': (context) => const UseFuturePage(),
        '/useListenable': (context) => const UseListenablePage(),
        '/useScrollController': (context) => const UseScrollControllerPage(),
        '/useStreamController': (context) => const UseStreamControllerPage(),
        '/useReducer': (context) => const UseReducerPage(),
        '/useAppLifecycleState': (context) => const UseAppLifecycleStatePage()
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
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useStream');
              },
              child: const Text('UseStream'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useState');
              },
              child: const Text('UseState'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useFuture');
              },
              child: const Text('UseFuture'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useListenable');
              },
              child: const Text('UseListenable'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useScrollController');
              },
              child: const Text('UseScrollController'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useStreamController');
              },
              child: const Text('UseStreamController'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useReducer');
              },
              child: const Text('UseReducer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/useAppLifecycleState');
              },
              child: const Text('UseAppLifecycleState'),
            ),
          ],
        ),
      ),
    );
  }
}
