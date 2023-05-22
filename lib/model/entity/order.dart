class Order {
  int? id;
  int storeId;
  int tableNumber;
  String? description;
  String? createdAt;
  int? authCode;

  Order({
    this.id,
    required this.storeId,
    required this.tableNumber,
    this.description,
    this.createdAt,
    this.authCode,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      storeId: json['store'],
      tableNumber: json['table_number'],
      description: json['description'],
      createdAt: json['created_at_time'],
      authCode: json['auth_code'],
    );
  }

  Map<String, dynamic> toJson() => {
    'store': storeId,
    'table_number': tableNumber,
    'description': description,
    'created_at': createdAt,
    'auth_code': authCode,
  };
}