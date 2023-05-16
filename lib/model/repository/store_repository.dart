import 'package:FastFeed/model/entity/store.dart';

abstract class StoreRepository{
  Future<List<Store>> getStores(int id);

  Future<Store> addStore(Store store);

  Future<void> editStore(Store store);

  Future<void> deleteStore(Store store);
}