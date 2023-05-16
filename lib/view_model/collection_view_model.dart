import 'dart:async';

import 'package:FastFeed/model/entity/product.dart';
import 'package:FastFeed/model/repository/collection_repository_impl.dart';
import 'package:flutter/cupertino.dart';

import '../model/entity/collection.dart';

class CollectionViewModel extends ChangeNotifier {
  var repository = CollectionRepositoryImpl();

  StreamController<List<Collection>> collections =
      StreamController<List<Collection>>();
  StreamController<List<Product>> products = StreamController<List<Product>>();

  void getCollections() async {
    collections.add(await repository.getCollections());
    notifyListeners();
  }

  void getProducts() async {
    products.add(await repository.getProducts());
    notifyListeners();
  }

  Future<int> addCollection(Collection collection) async {
    var newCollection = await repository.addCollection(collection);
    notifyListeners();
    return newCollection.id ?? 0;
  }

  Future<int> addProduct(Product product) async {
    var newProduct = await repository.addProduct(product);
    notifyListeners();
    return newProduct.id ?? 0;
  }

  void editCollection(Collection collection) async {
    await repository.editCollection(collection);
    notifyListeners();
  }

  void editProduct(Product product) async {
    await repository.editProduct(product);
    notifyListeners();
  }

  void deleteCollection(Collection collection) async {
    await repository.deleteCollection(collection);
    notifyListeners();
  }

  void deleteProduct(Product product) async {
    await repository.deleteProduct(product);
    notifyListeners();
  }
}
