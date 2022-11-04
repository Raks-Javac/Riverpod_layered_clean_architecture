import 'package:bottom_nav_test/feature/bot_nav_test/counter_1.dart';
import 'package:bottom_nav_test/feature/feed_test_feature/presentation/views/views_t.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;

  int get getPageIndex => state;
  void changeIndexState(int index) {
    state = index;
  }

  Widget returnSelected() {
    return pages()[getPageIndex];
  }

  bool activeCameraIcon = false;
  Color backgroundColor = Colors.white;

  colorsChangeBackGround(int index) {
    if (index == 1) {
      backgroundColor = Colors.black;
      activeCameraIcon = true;
    } else {
      backgroundColor = Colors.white;
      activeCameraIcon = false;
    }
  }

  List<Widget> pages() {
    return [
      const ViewTesting(),
      Container(
        color: backgroundColor,
      ),
      const Counter1(),
    ];
  }

  List<BottomNavigationBarItem> bottomNavItems() {
    return [
      const BottomNavigationBarItem(
          activeIcon: Icon(Icons.access_alarms_outlined),
          icon: Icon(Icons.ac_unit),
          label: ""),
      BottomNavigationBarItem(
          icon: (activeCameraIcon != true)
              ? const Icon(Icons.abc_rounded)
              : const Icon(Icons.camera),
          label: ""),
      const BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit_outlined), label: ""),
    ];
  }
}
