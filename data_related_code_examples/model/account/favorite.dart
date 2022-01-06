class Favorite {
  int id;
  String name;
  String address;
  int minPrice;
  int maxPrice;

  Favorite({
    required this.id,
    required this.name,
    required this.address,
    required this.minPrice,
    required this.maxPrice,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        minPrice: json["minPrice"],
        maxPrice: json["maxPrice"],
      );
}
