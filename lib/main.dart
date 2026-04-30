import 'package:delivery_live_tracking/features/delivery/presentation/view/delivery_screen.dart';
import 'package:delivery_live_tracking/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Live Tracking',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: const DeliveryScreen(),
    );
  }
}
