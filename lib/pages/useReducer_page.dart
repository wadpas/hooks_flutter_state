import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url =
    'https://a.cdn-hotels.com/gdcs/production153/d1371/e6c1f55e-51ac-41d5-8c63-2d0c63faf59e.jpg';

enum Action {
  rotateLeft,
  rotateRight,
  moreVIsible,
  lessVissible,
}

@immutable
class State {
  final double rotationDeg;
  final double alpa;

  const State({
    required this.rotationDeg,
    required this.alpa,
  });

  const State.zero()
      : rotationDeg = 0.0,
        alpa = 1;

  State rotateRight() => State(
        rotationDeg: rotationDeg + 10.0,
        alpa: alpa,
      );
  State rotateLeft() => State(
        rotationDeg: rotationDeg - 10.0,
        alpa: alpa,
      );
  State increaseAlpa() => State(
        rotationDeg: rotationDeg,
        alpa: min(alpa + 0.1, 1.0),
      );
  State decreaseAlpa() => State(
        rotationDeg: rotationDeg,
        alpa: min(alpa - 0.1, 1.0),
      );
}

State reducer(State oldState, Action? action) {
  switch (action) {
    case Action.rotateLeft:
      return oldState.rotateLeft();
    case Action.rotateRight:
      return oldState.rotateRight();
    case Action.moreVIsible:
      return oldState.increaseAlpa();
    case Action.lessVissible:
      return oldState.decreaseAlpa();
    case null:
      return oldState;
  }
}

class UseReducerPage extends HookWidget {
  const UseReducerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = useReducer<State, Action?>(reducer,
        initialState: const State.zero(), initialAction: null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UseReducer'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  store.dispatch(Action.rotateLeft);
                },
                child: const Text('Rotate Left'),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.rotateRight);
                },
                child: const Text('Rotate Right'),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.lessVissible);
                },
                child: const Text('- Alpa'),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.moreVIsible);
                },
                child: const Text('+ Alpa'),
              )
            ],
          ),
          Opacity(
            opacity: store.state.alpa,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(
                store.state.rotationDeg / 360.0,
              ),
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
          ),
        ],
      ),
    );
  }
}
