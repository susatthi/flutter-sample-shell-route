import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ダッシュボード'),
        actions: [
          IconButton(
            onPressed: () => const CartRouteData().go(context),
            icon: const Icon(Icons.shopping_cart),
          )
        ],
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
