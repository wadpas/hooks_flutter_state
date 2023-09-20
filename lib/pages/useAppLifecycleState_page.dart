import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url =
    'https://randelltiongson.com/wp-content/uploads/2016/05/CreditCard.png';

class UseAppLifecycleStatePage extends HookWidget {
  const UseAppLifecycleStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();
    return Scaffold(
      appBar: AppBar(
        title: const Text('UseAppLifecycleState Page'),
      ),
      body: Opacity(
        opacity: state == AppLifecycleState.resumed ? 1.0 : 0.0,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withAlpha(100),
                spreadRadius: 10,
              )
            ],
          ),
          child: Image.asset('assets/card.png'),
        ),
      ),
    );
  }
}
