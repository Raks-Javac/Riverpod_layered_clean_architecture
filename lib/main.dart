import 'package:bottom_nav_test/feature/bot_nav_test/bottom_nav_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BottomNavOptions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BotttomNavScreen(),
    );
  }
}
