import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カート'),
      ),
      body: const ColoredBox(
        color: Colors.red,
        child: Center(
          child: Text('カート'),
        ),
      ),
    );
  }
}
