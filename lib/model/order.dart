class OrdersModel {
  final String id; // إضافة خاصية id
  final String name;
  final int quantity;

  OrdersModel({
    required this.id,
    required this.name,
    required this.quantity,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // تضمين id في JSON
      'name': name,
      'quantity': quantity,
    };
  }
}
