import 'package:flutter/material.dart';
import 'package:owner_ordering_frontend/model/entity/socketData.dart';
import 'package:owner_ordering_frontend/utils/constants.dart';

import '../../../model/entity/order.dart';
import '../../../model/entity/orderItem.dart';
import '../../../utils/constants.dart';
import './currentOrder.dart';


class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // late Orders _model;


  // Map<String, dynamic> socketDataJson = socketData.toJson();


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: WhiteColor,
        drawer: Drawer(
          backgroundColor: YellowColor,
          elevation: 16,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: Text('سفارش ها',style: TextStyle(color: BlackColor),),
                ),
                Divider(
                  thickness: 1,
                  color: BlackColor,
                ),
                TextButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: Text('تغییر منو',style: TextStyle(color: BlackColor),),
                  ),
                Divider(
                  thickness: 1,
                  color: BlackColor,
                ),
                TextButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: Text('خروج',style: TextStyle(color: BlackColor),),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(),
        body: SizedBox(child: _OrderBody(),),
      ),
    );
  }
}
class _OrderBody extends StatelessWidget {
  const _OrderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SocketData socketData = SocketData(order: order, orderItem: orderItems);
    var orders = <Order>[];
    ScrollController _scrollController = ScrollController();

    void _scrollDown() {
      try {
        Future.delayed(
            const Duration(milliseconds: 300),
                () => _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent));
      } on Exception catch (_) {}
    }

    return Expanded(
      child: StreamBuilder(
        // stream: SocketService.getResponse,
        builder: (BuildContext context, AsyncSnapshot<Order> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data != null) {
            orders.add(snapshot.data!);
          }
          _scrollDown();
          return ListView.builder(
            controller: _scrollController,
            itemCount: orders.length,
            itemBuilder: (BuildContext context, int index) =>
                CurrentOrder(socketData: socketData),
          );
        },
      ),
    );
  }
}


