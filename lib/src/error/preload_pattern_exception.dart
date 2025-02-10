import 'package:haptic_x/src/error/haptic_x_exception.dart';

final class PreloadPatternException extends HapticXException {
  final String message;

  const PreloadPatternException(this.message);
}
