class GeographicPoint {
  GeographicPoint(this.lat, this.lng);

  double lat;
  double lng;

  @override
  String toString() {
    return "${lat.toStringAsFixed(8)}, ${lng.toStringAsFixed(8)}";
  }
}
