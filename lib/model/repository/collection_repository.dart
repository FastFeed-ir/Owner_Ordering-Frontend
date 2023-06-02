import 'package:owner_ordering_frontend/model/entity/product.dart';

import '../entity/collection.dart';

abstract class CollectionRepository {
  Future<List<Collection>> getCollections(int storeId);

  Future<List<Product>> getProducts(int storeId);

  Future<Collection> addCollection(Collection collection);

  Future<Product> addProduct(Product product);

  Future<void> editCollection(Collection collection);

  Future<void> editProduct(Product product);

  Future<void> deleteCollection(Collection collection);

  Future<void> deleteProduct(Product product);
}
