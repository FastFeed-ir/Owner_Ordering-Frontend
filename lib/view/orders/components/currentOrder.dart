import 'package:flutter/material.dart';

import '../../../model/entity/orderItem.dart';
import '../../../model/entity/socketData.dart';
import '../../../utils/constants.dart';
import '../../../view_model/order_viewmodel.dart';

class CurrentOrder extends StatefulWidget {
  final SocketData socketData;

  CurrentOrder({Key? key, required this.socketData}) : super(key: key);

  @override
  State<CurrentOrder> createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  @override
  void initState() {
    _orderViewModel.getTotal(widget.socketData.order.id!);
    super.initState();
  }

  final _orderViewModel = OrderViewModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.socketData.order.tableNumber.toString() + "میز:",
            textAlign: TextAlign.right,
            style: const TextStyle(
                fontFamily: "iransans",
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
          Container(
            child: Column(
              children: [
                ListView.builder(
                    itemCount: widget.socketData.orderItem.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      left: 700,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget
                                  .socketData.orderItem[index].productTitle!),
                              Text(widget
                                  .socketData.orderItem[index].productUnitPrice
                                  .toString()),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.socketData.orderItem[index].quantity
                                  .toString()),
                              Text((widget.socketData.orderItem[index]
                                          .productUnitPrice! *
                                      widget
                                          .socketData.orderItem[index].quantity)
                                  .toString()),
                            ],
                          ),
                        ],
                      );
                    }),
                Row(children: [
                  Text(widget.socketData.order.description!),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("مبلغ قابل پرداخت: "),
                    Text(_orderViewModel.totalPrice as String),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: YellowColor,
                          fixedSize: Size.fromWidth(150),
                        ),
                        child: Text(
                          'بستن',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "IranSansWeb",
                          ),
                        ),
                        onPressed: () async {
                          //TODO close order
                        }),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: YellowColor,
                          fixedSize: Size.fromWidth(150),
                        ),
                        child: Text(
                          'لغو',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "IranSansWeb",
                          ),
                        ),
                        onPressed: () async {
                          //TODO cancel order
                        }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
