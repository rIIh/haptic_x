import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'haptic_x_method_channel.dart';

abstract class HapticXPlatform extends PlatformInterface {
  /// Constructs a HapticXPlatform.
  HapticXPlatform() : super(token: _token);

  static final Object _token = Object();

  static HapticXPlatform _instance = MethodChannelHapticX();

  /// The default instance of [HapticXPlatform] to use.
  ///
  /// Defaults to [MethodChannelHapticX].
  static HapticXPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HapticXPlatform] when
  /// they register themselves.
  static set instance(HapticXPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> preload(String id, String data) async {
    throw UnimplementedError('preload() has not been implemented.');
  }

  Future<void> play(String id) async {
    throw UnimplementedError('play() has not been implemented.');
  }

  Future<void> release(String id) async {
    throw UnimplementedError('release() has not been implemented.');
  }
}
