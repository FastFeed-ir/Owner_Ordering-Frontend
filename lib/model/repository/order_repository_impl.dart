import '../entity/order.dart';
import '../util/constants.dart';
import 'order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<double> getTotal(int orderId) async {
    var response = await dio.get('orders/$orderId/total/');
    print('response: ${response.statusMessage}');
    if (response.statusCode == 200) {
      final data = response.data;
      double total = data['total_price'];
      //check it maybe need to casting
      return total;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<void> deleteOrder(Order order) async {
    var response = await dio.delete(
      'orders/${order.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}
