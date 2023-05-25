import 'package:owner_ordering_frontend/model/entity/subscription.dart';

abstract class SubscriptonRepository {
  Future<List<Subscription>> getSubscription(int busineesOwnerId);

  Future<void> addSubscription(Subscription subscription);

  Future<void> editSubscription(Subscription subscription);

  Future<void> deleteSubscription(Subscription subscription);
}
