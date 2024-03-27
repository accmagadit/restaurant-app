class Menu {
  final List<String> foods;
  final List<String> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    List<String> foods =
        List<String>.from(json['foods'].map((food) => food['name']));
    List<String> drinks =
        List<String>.from(json['drinks'].map((drink) => drink['name']));

    return Menu(
      foods: foods,
      drinks: drinks,
    );
  }
}

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menu menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      menus: Menu.fromJson(json['menus']),
    );
  }
}
