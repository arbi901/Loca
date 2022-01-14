class House {
  final String type;
  final num rooms;
  final num price;
  final num rating;
  final String date;
  final String address;
  final String description;
  final String municipality;
  final String region;
  ///List<String> imagesUrls;
  const House(
      {required this.type,
      required this.rooms,
      required this.price,
      required this.rating,
      required this.date,
      required this.address,
      required this.description,
      required this.municipality,
      required this.region,
    });
}
