class Product {
  final String name;
  final String company;
  final double price;
  final String description;
  final String picture;

  Product({
    required this.name,
    required this.company,
    required this.price,
    required this.description,
    required this.picture,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      company: json['company'],
      price: json['price'].toDouble(),
      description: json['description'],
      picture: json['picture'],
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'name': name,
      'company': company,
      'price': price,
      'description': description,
      'picture': picture,
    };
  }
}
