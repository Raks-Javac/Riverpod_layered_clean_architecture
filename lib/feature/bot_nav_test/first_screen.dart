import 'package:bottom_nav_test/feature/bot_nav_test/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstScreen extends ConsumerWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchProvider = ref.watch(counterProvider.notifier);
    return Container(
      color: watchProvider.backgroundColor,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              watchProvider.changeIndexState(2);
            },
            child: const Text("Change nav state"),
          )
        ],
      ),
    );
  }
}
