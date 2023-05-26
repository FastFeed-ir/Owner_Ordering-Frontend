import '../entity/order.dart';

abstract class OrderRepository {
  Future<int> getTotal(int id);
}