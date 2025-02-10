import 'package:haptic_x/src/error/haptic_x_exception.dart';

final class ReleasePatternException extends HapticXException {
  final String message;

  const ReleasePatternException(this.message);
}
