import 'dart:async';

import '../../../model/entity/subscription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/entity/store.dart';
import '../../../utils/constants.dart';
import '../../../view_model/store_viewmodel.dart';
import '../../../view_model/subscription_viewmodel.dart';
import 'restaurant_style.dart';

class RestaurantListScreen extends StatefulWidget {
  var ownerId = Get.arguments;

  RestaurantListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  late int id ;
  late int storeId;
  late int period;
  late double amount;
  String? url;
  String? startDate;

  final List<Subscription> _subs = [];
  final List<Store> _stores = [];
  final _subModel = SubscriptionViewModel();
  final _storeModel = StoreViewModel();

  bool _showNoSub = false;

  @override
  initState() {
    super.initState();
    id = widget.ownerId;
    getStore();
    getSubscripton().then((_) => Timer(Duration(seconds: 5), (){
      setState((){
        _showNoSub = _subs.isEmpty && _stores.isEmpty;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        appBar: AppBarMenu(),
        body: restaurantList(),
      ),
    );
  }

  @override
  Widget restaurantList() {
    if (_subs.isEmpty && _stores.isEmpty) {
      if (_showNoSub) {
        return noSub();
      } else {
        return loading();
      }
    } else {
      return buildList();
    }
  }

  Widget buildList() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 50,
      ),
      children: [
        Column(
          children: List.generate(
            _subs.length,
            (index) {
              Subscription subscriptionModel = _subs[index];
              Store store = Store(
                  business_owner: 0,
                  title: '',
                  business_type: 0,
                  state: 0,
                  owner_phone_number: '',
                  tables_count: 0,
                  telephone_number: '',
                  logo: '',
                  city: '',
                  address: '',
                  instagram_page_link: '');
              for (var item in _stores) {
                if (subscriptionModel.store == item.id) {
                  store = item;
                }
              }
              return Column(
                children: [
                  buildListItem(subscriptionModel, store, index),
                  SizedBox(height: 30,),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget noSub() {
    return Container(
      padding: EdgeInsets.only(
        left: 24.0,
        top: 50.0,
        right: 24.0,
      ),
      width: 1920,
      height: 700,
      child: Center(
        //TODO Empty list dialog
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              SadFace,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            RestaurantTextStyle(text: "اشتراکی وجود ندارد"),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(Subscription subscriptionModel, Store store, int index) {
    return Container(
      // ToDo get name from API
      padding: EdgeInsets.only(right: 20, left: 10, bottom: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: BlackColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: restaurantTitle(
          store.title,
          subscriptionModel.created_at,
          subscriptionModel.period,
          subscriptionModel.business_owner,
          subscriptionModel.store
      ),
    );
  }
  Future<void> getSubscripton() async {
    _subModel.getSubscriptions(id);
    _subModel.subscriptions.stream.listen((list) {
      setState(() {
        _subs.addAll(list);
      });
    });
  }

  void getStore() {
    _storeModel.getStores(id);
    _storeModel.stores.stream.listen((list) {
      setState(() {
        _stores.addAll(list);
      });
    });
  }
}
