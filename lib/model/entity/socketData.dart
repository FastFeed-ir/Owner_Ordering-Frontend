import 'order.dart';
import 'orderItem.dart';

class SocketData {
  Order order;
  List<OrderItem> orderItem;

  SocketData({required this.order, required this.orderItem});

  factory SocketData.fromJson(Map<String, dynamic> json) {
    return SocketData(
      order: Order.fromJson(json['order']),
      orderItem: List<OrderItem>.from(
        json['orderItems'].map((item) => OrderItem.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'order': order.toJson(),
    'orderItems': List<dynamic>.from(orderItem.map((item) => item.toJson())),
  };
}