// ignore_for_file: unnecessary_brace_in_string_interps

class UTMPoint {
  UTMPoint(
    this.easting,
    this.northing, {
    this.zoneNumber = 36,
    this.zoneLetter = 'R',
  });

  double easting;
  double northing;
  int zoneNumber;
  String zoneLetter;

  @override
  String toString() {
    return "${zoneNumber}${zoneLetter}, ${northing.toStringAsFixed(3)}N, ${easting.toStringAsFixed(3)}E";
  }
}
