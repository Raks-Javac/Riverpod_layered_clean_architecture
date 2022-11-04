import 'package:bottom_nav_test/feature/bot_nav_test/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter1 extends ConsumerWidget {
  const Counter1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider.notifier);
    return Center(child: Text(count.getPageIndex.toString()));
  }
}
