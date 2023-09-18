import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Inherited Pattern',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lime,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inherited Pattern')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/inherited-model');
            },
            child: const Text('Inherited Model'),
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
    );
  }
}
