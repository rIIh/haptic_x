import 'src/haptic_x_platform_interface.dart';

class HapticX {
  Future<void> preload(String id, String data) async {
    return HapticXPlatform.instance.preload(id, data);
  }

  Future<void> play(String id) async {
    return HapticXPlatform.instance.play(id);
  }

  Future<void> release(String id) async {
    return HapticXPlatform.instance.release(id);
  }
}
