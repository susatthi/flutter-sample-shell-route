import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ダッシュボード'),
      ),
      body: const ColoredBox(
        color: Colors.amber,
        child: Center(
          child: Text('ダッシュボード'),
        ),
      ),
    );
  }
}
