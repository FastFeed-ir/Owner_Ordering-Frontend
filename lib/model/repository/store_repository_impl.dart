import 'package:owner_ordering_frontend/model/entity/store.dart';
import 'package:dio/dio.dart';
import '../util/constants.dart';
import 'store_repository.dart';

class StoreRepositoryImpl extends StoreRepository {
  var dio = Dio(options);

  @override
  Future<List<Store>> getStores(int busineesOwnerId) async {
    var response = await dio.get('stores/?business_owner=$busineesOwnerId');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Store> stores = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var store = Store.fromJson(data);
          stores.add(store);
        }
      }
      return stores;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Store> addStore(Store store) async {
    var response = await dio.post(
      'stores/',
      data: store,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newStore = Store.fromJson(response.data);
    return newStore;
  }

  @override
  Future<void> editStore(Store store) async {
    var response = await dio.patch(
      'stores/${store.id}/',
      data: store,
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> deleteStore(Store store) async {
    var response = await dio.delete(
      'stores/${store.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}
