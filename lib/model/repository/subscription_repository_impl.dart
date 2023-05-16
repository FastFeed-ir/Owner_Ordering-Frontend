import 'package:FastFeed/model/entity/subscription_model.dart';
import 'package:dio/dio.dart';

import '../util/constants.dart';
import 'subscription_repository.dart';

class SubscriptionRepositoryImpl extends SubscriptonRepository{
  var dio = Dio(options);
  @override
  Future<List<SubscriptionModel>> getSubscription(int id) async{
    var response = await dio.get('subscriptions/');
    print('response: ${response.statusMessage} responceCode: ${response.statusCode}');
    if(response.data is List){
      List<dynamic> dataList = response.data;
      List<SubscriptionModel> subscriptions = [];
      for(var data in dataList){
        if(data is Map<String, dynamic>){
          var sub = SubscriptionModel.fromJson(data);
          if(sub.business_owner == id)
            subscriptions.add(sub);
        }
      }
      return subscriptions;
    }else{
      throw Exception('Invalid response');
    }
  }

  @override
  Future<SubscriptionModel> addSubscription(SubscriptionModel subscription)  async{
    var response = await dio.post('subscriptions/',data: subscription);
    print('add:  response: ${response.statusMessage}    data: ${response.data}');
    final newSub = SubscriptionModel.fromJson(response.data);
    return newSub;
  }
  @override
  Future<void> editSubscription(SubscriptionModel subscription)  async{
    var response = await dio.patch(
      'subscriptions/${subscription.id}/',
      data: subscription,
    );
    print('edit:  response: ${response.statusMessage}    data: ${response.data}');
  }

  Future<void> deleteSubscription(SubscriptionModel subscription) async{
    var response = await dio.delete(
      'subscriptions/${subscription.id}/',
    );
    print('response: ${response.statusMessage}');
  }


}

