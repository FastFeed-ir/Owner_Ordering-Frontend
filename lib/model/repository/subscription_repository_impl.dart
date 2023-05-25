import 'package:owner_ordering_frontend/model/entity/subscription.dart';
import 'package:dio/dio.dart';

import '../util/constants.dart';
import 'subscription_repository.dart';

class SubscriptionRepositoryImpl extends SubscriptonRepository {
  var dio = Dio(options);
  @override
  Future<List<Subscription>> getSubscription(int busineesOwnerId) async {
    var response =
        await dio.get('subscriptions/?business_owner=$busineesOwnerId');
    print(
        'response: ${response.statusMessage} responceCode: ${response.statusCode}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Subscription> subscriptions = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var sub = Subscription.fromJson(data);
          subscriptions.add(sub);
        }
      }
      return subscriptions;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Subscription> addSubscription(Subscription subscription) async {
    var response = await dio.post('subscriptions/', data: subscription);
    print(
        'add:  response: ${response.statusMessage}    data: ${response.data}');
    final newSub = Subscription.fromJson(response.data);
    return newSub;
  }

  @override
  Future<void> editSubscription(Subscription subscription) async {
    var response = await dio.patch(
      'subscriptions/${subscription.id}/',
      data: subscription,
    );
    print(
        'edit:  response: ${response.statusMessage}    data: ${response.data}');
  }

  Future<void> deleteSubscription(Subscription subscription) async {
    var response = await dio.delete(
      'subscriptions/${subscription.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}
