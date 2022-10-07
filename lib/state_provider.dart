import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statevalueProvider = StateProvider<int>((ref) => 0);

class stateProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(statevalueProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('State Provider')),
      body: Column(
        children: [
          Text(value.toString()),
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                value++;
              })
        ],
      ),
    );
  }
}
