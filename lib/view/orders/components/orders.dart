import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:owner_ordering_frontend/model/entity/socketData.dart';
import 'package:owner_ordering_frontend/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/repository/socket_service.dart';
import './currentOrder.dart';
import './passedOrder.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);
  var parameter = Get.arguments;
  @override
  State<Orders> createState() => _OrdersState();
}

var currentOrders = <SocketData>[];
var passedOrders = <SocketData>[];

class _OrdersState extends State<Orders> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late int storeId;
  late int ownerId;
  @override
  void initState() {
    super.initState();
    ownerId = widget.parameter[0];
    storeId = widget.parameter[1];


  }

  @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: WhiteColor,
          drawer: Drawer(
            backgroundColor: YellowColor,
            elevation: 16,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'سفارش ها',
                      style: TextStyle(color: BlackColor,),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: BlackColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Get.toNamed(CategoriesPage, arguments: storeId);
                    },
                    child: const Text(
                      'تغییر منو',
                      style: TextStyle(color: BlackColor),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: BlackColor,
                  ),
                  TextButton(
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool("loggedIn", false);
                      prefs.setInt("id", 0);
                      Get.toNamed(Loginsignup);
                    },
                    child: const Text(
                      'خروج',
                      style: TextStyle(color: BlackColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _OrderBody(socketDataStream: SocketService.getResponse),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _OrderBody extends StatefulWidget {
  final Stream<SocketData> socketDataStream;

  const _OrderBody({Key? key, required this.socketDataStream})
      : super(key: key);

  @override
  State<_OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<_OrderBody> {
  @override
  void closeOrder(SocketData socketData) {
    setState(() {
      currentOrders.remove(socketData);
      passedOrders.add(socketData);
    });
  }
  ScrollController _scrollController = ScrollController();

  void _scrollDown() {
    try {
      Future.delayed(
        const Duration(milliseconds: 300),
            () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent),
      );
    } on Exception catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "جاری",
              style: TextStyle(
                fontFamily: "iransans",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            StreamBuilder(
              stream: widget.socketDataStream,
              builder:
                  (BuildContext context, AsyncSnapshot<SocketData> snapshot) {
                if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData && snapshot.data != null) {
                  currentOrders.add(snapshot.data!);
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: currentOrders.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CurrentOrder(
                        socketData: currentOrders[index],
                        onClose: closeOrder,
                      ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "گذشته",
              style: TextStyle(
                fontFamily: "iransans",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: passedOrders.length,
              itemBuilder: (BuildContext context, int index) =>
                  PassedOrder(socketData: passedOrders[index]),
            ),
          ],
        ),
      ),
    );
  }
}
