import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

class SecondsPage extends HookWidget {
  const SecondsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seconds Page'),
      ),
      body: Center(
        child: Text(dateTime.data ?? 'No time'),
      ),
    );
  }
}
