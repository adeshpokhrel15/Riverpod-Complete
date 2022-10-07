import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = Provider<int>((ref) => 42);

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Container(
        child: Consumer(builder: (context, ref, child) {
          final value = ref.watch(numberProvider).toString();

          return Column(
            children: [
              Text(value),
            ],
          );
        }),
      ),
    );
  }
}
