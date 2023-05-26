import '../util/constants.dart';
import 'order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<int> getTotal(int id) async {
    var response = await dio.get('orders/$id/total/');
    print('response: ${response.statusMessage}');
    if (response.data is int) {
      int total = response.data;
      return total;
    } else {
      throw Exception('Invalid response');
    }
  }
}