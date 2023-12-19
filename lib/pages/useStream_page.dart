import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

class UseStreamPage extends HookWidget {
  const UseStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());
    return Scaffold(
      appBar: AppBar(
        title: const Text('UseStream'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              dateTime.data == null
                  ? 'No time'
                  : dateTime.data!.substring(0, 19),
            ),
          ],
        ),
      ),
    );
  }
}
