import 'dart:async';
import 'package:owner_ordering_frontend/model/entity/subscription.dart';
import 'package:owner_ordering_frontend/model/repository/subscription_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class SubscriptionViewModel extends ChangeNotifier {
  var repository = SubscriptionRepositoryImpl();
  StreamController<List<Subscription>> subscriptions =
      StreamController<List<Subscription>>();
  void getSubscriptions(int id) async {
    subscriptions.add(await repository.getSubscription(id));
    notifyListeners();
  }

  Future<Subscription> addSubscriptions(Subscription subscription) async {
    var code = await repository.addSubscription(subscription);
    notifyListeners();
    return code;
  }

  void editSubscriptions(Subscription subscription) async {
    repository.editSubscription(subscription);
    notifyListeners();
  }

  void deleteSubscriptions(Subscription subscription) async {
    repository.deleteSubscription(subscription);
    notifyListeners();
  }
}
