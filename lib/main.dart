// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/provider/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpodapp"),
      ),
      body: Center(
        child: Text(
          ': $count',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state--;
                },
                icon: Icon(Icons.remove)),
            IconButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state = 0;
                },
                icon: Icon(Icons.refresh)),
          ],
        ),
      ),
    );
  }
}
