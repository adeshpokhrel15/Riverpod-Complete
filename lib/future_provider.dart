import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<int> fetchMethod() async {
  await Future.delayed(const Duration(seconds: 2));
  return 20;
}

final futureprovider = FutureProvider<int>((ref) => fetchMethod());

class FutureProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Consumer(builder: ((context, ref, child) {
        final value = ref.watch(futureprovider);

        return Column(
          children: [
            value.when(
                data: (data) {
                  return Text(data.toString());
                },
                error: ((error, stackTrace) {
                  return Text(':$error');
                }),
                loading: () => const CircularProgressIndicator())
          ],
        );
      })),
    );
  }
}
