class OrderItem {
  int? id;
  int product;
  String? productTitle;
  double? productUnitPrice;
  int quantity;
  int order;

  OrderItem({
    this.id,
    required this.product,
    this.productTitle,
    this.productUnitPrice,
    required this.quantity,
    required this.order,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      product: json['product'],
      productTitle: json['product_title'],
      productUnitPrice: json['product_unit_price'],
      quantity: json['quantity'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() => {
    'product': product,
    'quantity': quantity,
    'order': order,
  };
}