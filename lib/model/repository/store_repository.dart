import 'package:owner_ordering_frontend/model/entity/store.dart';

abstract class StoreRepository{
  Future<List<Store>> getStores(int busineesOwnerId);

  Future<Store> addStore(Store store);

  Future<void> editStore(Store store);

  Future<void> deleteStore(Store store);
}