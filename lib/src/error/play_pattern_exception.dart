import 'package:haptic_x/src/error/haptic_x_exception.dart';

final class PlayPatternException extends HapticXException {
  final String message;

  const PlayPatternException(this.message);
}
