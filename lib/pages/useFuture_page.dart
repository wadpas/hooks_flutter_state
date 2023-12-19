import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(
        transform ?? (e) => e,
      ).where((e) => e != null).cast();
}

const url =
    'https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg';

class UseFuturePage extends HookWidget {
  const UseFuturePage({super.key});
  @override
  Widget build(BuildContext context) {
    final future = useMemoized(
      () => NetworkAssetBundle(Uri.parse(url))
          .load(url)
          .then((data) => data.buffer.asUint8List())
          .then((data) => Image.memory(data)),
    );

    final snapshot = useFuture(future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UseFuture'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            if (snapshot.data == null)
              const Center(
                child: CircularProgressIndicator(),
              ),
            Column(
              children: [snapshot.data].compactMap().toList(),
            ),
          ],
        ),
      ),
    );
  }
}
