class ProductModel {
  final int id;  // إضافة هذا السطر
  final String name;
  final double price;
  final String image;

  ProductModel({
    required this.id,  //
    required this.name,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],  // قراءة الـ id من JSON
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,  // تضمين الـ id في تحويل البيانات إلى JSON
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
