@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Classes/Messages.g.swift',
  swiftOptions: SwiftOptions(),
  // copyrightHeader: 'pigeons/copyright.txt',
  dartPackageName: 'haptic_x',
))
library interface;

import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class HapticXApi {
  void preload(String id, String data);

  void play(String id);

  void release(String id);
}
