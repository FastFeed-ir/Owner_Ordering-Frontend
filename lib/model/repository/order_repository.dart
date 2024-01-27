import '../entity/order.dart';

abstract class OrderRepository {
  Future<double> getTotal(int orderId);

  Future<void> deleteOrder(Order order);
}
