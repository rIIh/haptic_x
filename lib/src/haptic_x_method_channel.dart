import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:haptic_x/src/error/play_pattern_exception.dart';
import 'package:haptic_x/src/error/preload_pattern_exception.dart';
import 'package:haptic_x/src/error/release_pattern_exception.dart';
import 'package:haptic_x/src/messages.g.dart';

import 'haptic_x_platform_interface.dart';

class MethodChannelHapticX extends HapticXPlatform {
  @visibleForTesting
  final api = HapticXApi();

  @override
  Future<void> preload(String id, String data) async {
    try {
      return await api.preload(id, data);
    } on PlatformException catch (e) {
      throw PreloadPatternException(e.message ?? 'Failed to preload pattern');
    }
  }

  @override
  Future<void> play(String id) async {
    try {
      return await api.play(id);
    } on PlatformException catch (e) {
      throw PlayPatternException(e.message ?? 'Failed to play pattern');
    }
  }

  @override
  Future<void> release(String id) async {
    try {
      return await api.release(id);
    } on PlatformException catch (e) {
      throw ReleasePatternException(e.message ?? 'Failed to release pattern');
    }
  }
}
