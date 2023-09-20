import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url = 'https://www.imgonline.com.ua/examples/bee-on-daisy.jpg';

class UseStreamControllerPage extends HookWidget {
  const UseStreamControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;
    controller = useStreamController<double>(onListen: () {
      controller.sink.add(0.0);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('UseStreamController Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            StreamBuilder<Object>(
                stream: controller.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    final rotation = snapshot.data as double;
                    return GestureDetector(
                      onTap: () {
                        controller.sink.add(rotation + 10.0);
                      },
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(rotation / 360.0),
                        child: Image.network(
                          url,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
            Container(
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("< Back"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
