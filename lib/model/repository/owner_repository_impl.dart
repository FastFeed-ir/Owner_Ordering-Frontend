import 'package:FastFeed/model/entity/owner.dart';
import 'package:dio/dio.dart';
import '../util/constants.dart';
import 'owner_repository.dart';


class OwnerRepositoryImpl extends OwnerRepository {
  var dio = Dio(options);

  @override
  Future<List<Owner>> getOwners() async {
    var response = await dio.get('owners/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Owner> owners = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var owner = Owner.fromJson(data);
          owners.add(owner);
        }
      }
      return owners;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<Owner>> searchOwners(int id)  async {
    var response = await dio.get('owners/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Owner> owners = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var owner = Owner.fromJson(data);
          if(owner.id == id) {
            owners.add(owner);
          }
        }
      }
      return owners;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<List<Owner>> searchPhone(String Phone) async{
    var response = await dio.get('owners/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Owner> owners = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var owner = Owner.fromJson(data);
          if(owner.phone_number == Phone) {
            owners.add(owner);
          }
        }
      }
      return owners;
    } else {
      throw Exception('Invalid response');
    }
  }
  @override
  Future<Owner> addOwner(Owner owner) async {
    var response = await dio.post(
      'owners/',
      data: owner,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newOwner = Owner.fromJson(response.data);
    return newOwner;
  }
  @override
  Future<void> editOwner(Owner owner) async {
    var response = await dio.patch(
      'owners/${owner.id}/',
      data: owner,
    );
    print('response: ${response.statusMessage}');
  }
  @override
  Future<void> deleteOwner(Owner owner) async {
    var response = await dio.delete(
      'owners/${owner.id}/',
    );
    print('response: ${response.statusMessage}');
  }




}