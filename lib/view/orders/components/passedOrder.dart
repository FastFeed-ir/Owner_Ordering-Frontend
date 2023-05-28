import 'package:flutter/material.dart';

import '../../../model/entity/orderItem.dart';
import '../../../model/entity/socketData.dart';
import '../../../utils/constants.dart';
import '../../../view_model/order_viewmodel.dart';

class PassedOrder extends StatefulWidget {
  final SocketData socketData;

  PassedOrder({Key? key, required this.socketData}) : super(key: key);

  @override
  State<PassedOrder> createState() => _PassedOrderState();
}

class _PassedOrderState extends State<PassedOrder> {
  @override
  void initState() {
    _orderViewModel.getTotal(3);
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
                      left: 5,
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
                    Text(_orderViewModel.totalPrice.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
