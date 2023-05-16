import 'package:owner_ordering_frontend/model/entity/subscription_model.dart';

abstract class SubscriptonRepository{

  Future<List<SubscriptionModel>> getSubscription(int id);

  Future<void> addSubscription(SubscriptionModel subscription);

  Future<void> editSubscription(SubscriptionModel subscription);

  Future<void> deleteSubscription(SubscriptionModel subscription);
}