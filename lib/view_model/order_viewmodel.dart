import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:owner_ordering_frontend/utils/constants.dart';
import '../model/repository/order_repository_impl.dart';
import '../model/entity/order.dart';
class OrderViewModel extends ChangeNotifier {
  var repository = OrderRepositoryImpl();

  StreamController<int> total = StreamController<int>();

  void getTotal(int id) async {
    order.total = (await repository.getTotal(id));
    notifyListeners();
  }
}