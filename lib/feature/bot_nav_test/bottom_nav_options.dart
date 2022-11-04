import 'package:bottom_nav_test/feature/bot_nav_test/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BotttomNavScreen extends ConsumerWidget {
  const BotttomNavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    ref.watch(counterProvider);
    final watchProvider = ref.watch(counterProvider.notifier);
    return Scaffold(
        body: watchProvider.returnSelected(),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: watchProvider.backgroundColor,
            currentIndex: watchProvider.getPageIndex,
            onTap: (value) {
              watchProvider.changeIndexState(value);
              watchProvider.colorsChangeBackGround(value);
            },
            type: BottomNavigationBarType.fixed,
            items: watchProvider.bottomNavItems(),
          ),
        ));
  }
}
