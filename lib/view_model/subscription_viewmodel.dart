import 'dart:async';
import 'package:FastFeed/model/entity/subscription_model.dart';
import 'package:FastFeed/model/repository/subscription_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class SubscriptionViewModel extends ChangeNotifier{
  var repository = SubscriptionRepositoryImpl();
  StreamController<List<SubscriptionModel>> subscriptions =
  StreamController<List<SubscriptionModel>>();
  void getSubscriptions(int id) async{
    subscriptions.add(await repository.getSubscription(id));
    notifyListeners();
  }
  Future<SubscriptionModel> addSubscriptions(SubscriptionModel subscription) async{
    var code = await repository.addSubscription(subscription);
    notifyListeners();
    return code;
  }
  void editSubscriptions(SubscriptionModel subscription) async{
    repository.editSubscription(subscription);
    notifyListeners();
  }
  void deleteSubscriptions(SubscriptionModel subscription) async{
    repository.deleteSubscription(subscription);
    notifyListeners();
  }
}

