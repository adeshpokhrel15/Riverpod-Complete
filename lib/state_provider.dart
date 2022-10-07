import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statevalueProvider = StateProvider<int>((ref) => 0);

class stateProviderPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    final value = watch(statevalueProvider);
          final counter = value.state.toString;   
    return Scaffold(
      appBar: AppBar(title: const Text('State Provider')),
      
    );
  }
}
