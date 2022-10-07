import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<String>((ref) =>
    Stream.periodic(const Duration(microseconds: 20), (count) => '$count'));

class StreamProviderPage extends StatelessWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final value = ref.watch(streamProvider);

          return value.when(
              data: (data) {
                return Column(children: [Text(data.toString())]);
              },
              error: ((error, stackTrace) {
                return Text(':$error');
              }),
              loading: () => const CircularProgressIndicator());
        },
      ),
    );
  }
}
