import 'package:flutter/material.dart';
import 'package:owner_ordering_frontend/utils/constants.dart';

import '../../../utils/constants.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  // late Orders _model;

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

      ),
    );
  }
}


