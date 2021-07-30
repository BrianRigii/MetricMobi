class VenueModel {
  final String id;
  final String name;
  final String longitude;
  final String latitude;

  VenueModel({this.id, this.name, this.longitude, this.latitude});

  factory VenueModel.fromMap(venue) {
    return VenueModel(
        id: venue['id'],
        name: venue['name'],
        latitude: venue['latitude'],
        longitude: venue['longitude']);
  }
}
