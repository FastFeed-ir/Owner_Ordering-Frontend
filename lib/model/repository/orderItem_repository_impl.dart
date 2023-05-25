import 'package:dio/dio.dart';
import '../entity/orderItem.dart';
import '../util/constants.dart';
import 'orderItem_repository.dart';

class OrderItemRepositoryImpl extends OrderItemRepository {
  var dio = Dio(options);

  @override
  Future<OrderItem> addOrderItem(OrderItem orderItem) async {
    var response = await dio.post(
      'order_items/',
      data: orderItem,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newOrderItem = OrderItem.fromJson(response.data);
    return newOrderItem;
  }

  @override
  Future<void> deleteOrderItem(OrderItem orderItem) async {
    var response = await dio.delete(
      'stores/${orderItem.id}/',
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> editOrderItem(OrderItem orderItem) async {
    var response = await dio.patch(
      'order_items/${orderItem.id}/',
      data: orderItem,
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<List<OrderItem>> getOrderItems(int orderId) async {
    var response = await dio.get('order_items/?order_id=$orderId');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<OrderItem> orderItems = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var orderItem = OrderItem.fromJson(data);
          orderItems.add(orderItem);
        }
      }
      return orderItems;
    } else {
      throw Exception('Invalid response');
    }
  }
}