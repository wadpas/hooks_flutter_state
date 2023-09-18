import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;
  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(
      const Duration(seconds: 1),
      (value) => from - value * 2,
    ).takeWhile((value) => value >= 0).listen((value) {
      this.value = value;
    });
  }
  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}

class UseListenablePage extends HookWidget {
  const UseListenablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(
      () => CountDown(from: 20),
    );
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UseListenable Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              notifier.value.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("< Back"),
            )
          ],
        ),
      ),
    );
  }
}
