import '../../../model/entity/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../model/entity/store.dart';
import '../../../utils/constants.dart';
import '../../../view_model/store_viewmodel.dart';
import '../../../view_model/subscription_viewmodel.dart';
import 'restaurant_style.dart';

class RestaurantListScreen extends StatefulWidget {
  var owner = Get.arguments;

  RestaurantListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  int? id;
  late int storeId;
  late int period;
  late double amount;
  String? url;
  String? startDate;

  final List<SubscriptionModel> _subs = [
    SubscriptionModel(business_owner: 1, store: 2, period: 30, amount: 300000),
    SubscriptionModel(business_owner: 1, store: 3, period: 90, amount: 330000),
  ];
  final List<Store> _stores = [
    Store(id: 2,business_owner: 1, title: "زمانه", business_type: 1, state: 4, owner_phone_number: "091356425", telephone_number: "25998", tables_count: 5),
    Store(id: 3,business_owner: 1, title: "بهانه", business_type: 2, state: 2, owner_phone_number: "252552", telephone_number: "25635", tables_count: 8)
  ];
  final _subModel = SubscriptionViewModel();
  final _storeModel = StoreViewModel();

  bool _showNoSub = false;

  @override
  initState() {
    super.initState();
  /*  getStore();
    getSubscripton().then((_) => Timer(Duration(seconds: 5), (){
      setState((){
        _showNoSub = _subs.isEmpty && _stores.isEmpty;
      });
    }));*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        appBar: AppBarMenu(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(child: restaurantList()),
            ],
          ),
        ),
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
    return Container(
      padding: EdgeInsets.only(
        left: 24.0,
        top: 50.0,
        right: 24.0,
      ),
      width: 1920,
      //height: ((300 * _subs.length) + 300).h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
            itemCount: _subs.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20, right: 20,top: 15,),
            itemBuilder: (BuildContext context, int index) {
              // TODO loaing
              SubscriptionModel subscriptionModel = _subs[index];
              Store store = Store(business_owner: 0, title: '', business_type: 0, state: 0, owner_phone_number: '', tables_count: 0, telephone_number: '', logo: '', city: '', address: '', instagram_page_link: '');
              for(var item in _stores) {
                if(subscriptionModel.store == item.id){
                  store = item;
                }
              }
              return buildListItem(subscriptionModel, store, index);
            },
          ),
        ],
      ),
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
  Widget buildListItem(SubscriptionModel subscriptionModel, Store store, int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          // ToDo get name from API
          title: restaurantTitle(store.title, subscriptionModel.startDate,subscriptionModel.period, subscriptionModel.business_owner, subscriptionModel.store),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
/*  Future<void> getSubscripton() async {
    _subModel.getSubscriptions(widget.owner.id!);
    _subModel.subscriptions.stream.listen((list) {
      setState(() {
        _subs.addAll(list);
      });
    });
  }

  void getStore() {
    _storeModel.getStores(widget.owner.id!);
    _storeModel.stores.stream.listen((list) {
      setState(() {
        _stores.addAll(list);
      });
    });
  }*/
}
