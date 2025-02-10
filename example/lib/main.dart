import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haptic_x/haptic_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer<void> completer = Completer();

  @override
  void initState() {
    completer.complete(preload());
    super.initState();
  }

  @override
  void dispose() {
    completer.future.then((_) {
      HapticX().release('example.continuous');
      HapticX().release('example.transients');
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              Stopwatch stopwatch = Stopwatch()..start();

              await Future.wait([
                HapticX().play('example.continuous').then((_) => log(
                    'play(continuous): ${stopwatch.elapsed.inMilliseconds}ms')),
                HapticX().play('example.transients').then((_) => log(
                    'play(transients): ${stopwatch.elapsed.inMilliseconds}ms')),
              ]);

              log('play: ${stopwatch.elapsed.inMilliseconds}ms');
            },
            child: const Text('Play'),
          ),
        ),
      ),
    );
  }
}

Future<void> preload() async {
  var continuous = await rootBundle.load('assets/example.continuous.ahap');
  var transient = await rootBundle.load('assets/example.transients.ahap');

  Stopwatch stopwatch = Stopwatch()..start();

  await HapticX().preload(
    'example.continuous',
    utf8.decode(continuous.buffer.asUint8List()),
  );

  await HapticX().preload(
    'example.transients',
    utf8.decode(transient.buffer.asUint8List()),
  );

  log('preload: ${stopwatch.elapsed.inMilliseconds}ms');
}
