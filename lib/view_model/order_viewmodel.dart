import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:owner_ordering_frontend/utils/constants.dart';
import '../model/repository/order_repository_impl.dart';
import '../model/entity/order.dart';

class OrderViewModel extends ChangeNotifier {
  var repository = OrderRepositoryImpl();

  StreamController<double> totalPrice = StreamController<double>();

  void getTotal(int orderId) async {
    totalPrice =
        (await repository.getTotal(orderId)) as StreamController<double>;
    notifyListeners();
  }
}
