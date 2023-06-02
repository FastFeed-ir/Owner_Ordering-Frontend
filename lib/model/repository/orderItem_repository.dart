import '../entity/orderItem.dart';

abstract class OrderItemRepository {
  Future<List<OrderItem>> getOrderItems(int orderId);

  Future<OrderItem> addOrderItem(OrderItem orderItem);

  Future<void> editOrderItem(OrderItem orderItem);

  Future<void> deleteOrderItem(OrderItem orderItem);
}