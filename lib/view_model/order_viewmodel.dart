import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:owner_ordering_frontend/utils/constants.dart';
import '../model/repository/order_repository_impl.dart';
import '../model/entity/order.dart';

class OrderViewModel extends ChangeNotifier {
  var repository = OrderRepositoryImpl();

  double totalPrice= 0.0;
  StreamController<List<Order>> orders =
  StreamController<List<Order>>();

  void deleteOrder(Order order) async {
    repository.deleteOrder(order);
    notifyListeners();
  }

  void getTotal(int orderId) async {
    totalPrice = await repository.getTotal(orderId);
    notifyListeners();
  }

}
