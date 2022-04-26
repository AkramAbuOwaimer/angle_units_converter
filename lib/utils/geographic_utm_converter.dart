import 'dart:math';

class GeographicUTMConverter {
  double a = 6378137.0;
  double eccSquared = 0.00669438;

  String _getUTMLetterDesignator(double latitude) {
    if (84 >= latitude && latitude >= 72) {
      return 'X';
    } else if (72 >= latitude && latitude >= 64) {
      return 'W';
    } else {
      return 'Z';
    }
  } // TODO: complete it

  double degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  double radiansToDegrees(double radians) {
    return radians * (180 / pi);
  }
}
