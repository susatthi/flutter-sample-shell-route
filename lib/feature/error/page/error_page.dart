import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({
    super.key,
    this.error = 'エラーが発生しました',
  });

  final Object? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('エラー'),
      ),
      body: ColoredBox(
        color: Colors.amber,
        child: Center(
          child: Text('$error'),
        ),
      ),
    );
  }
}
