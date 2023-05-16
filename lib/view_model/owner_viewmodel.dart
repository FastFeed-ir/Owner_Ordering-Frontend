import 'dart:async';
import 'package:FastFeed/model/entity/owner.dart';
import 'package:FastFeed/model/repository/owner_repository_impl.dart';
import 'package:flutter/cupertino.dart';

class OwnerViewModel extends ChangeNotifier {
  var repository = OwnerRepositoryImpl();

  StreamController<List<Owner>> owners =
  StreamController<List<Owner>>();

  void getOwners() async {
    owners.add(await repository.getOwners());
    notifyListeners();
  }
  void searchOwners(int id) async {
    owners.add(await repository.searchOwners(id));
    notifyListeners();
  }
  void searchPhone(String Phone) async {
    owners.add(await repository.searchPhone(Phone));
    notifyListeners();
  }
  Future<Owner> addOwner(Owner owner) async {
    var newOwner = await repository.addOwner(owner);
    notifyListeners();
    return newOwner;
  }
  void editOwner(Owner owner) async {
    repository.editOwner(owner);
    notifyListeners();
  }
  void deleteOwner(Owner owner) async {
    repository.deleteOwner(owner);
    notifyListeners();
  }
}