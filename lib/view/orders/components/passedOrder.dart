import 'package:flutter/material.dart';
import 'package:owner_ordering_frontend/view_model/orderItem_viewmodel.dart';

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
    setState(() {});
    super.initState();
  }

  final _orderViewModel = OrderViewModel();
  final _orderItemViewModel = OrderItemViewModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: BoxDecoration(
          border: Border.all(width: 5), borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "میز: " + widget.socketData.order.tableNumber.toString(),
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontFamily: "iransans",
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: widget.socketData.orderItem.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget
                                  .socketData.orderItem[index].productTitle!),
                              Text(widget.socketData.orderItem[index]
                                      .productUnitPrice
                                      .toString() +
                                  " تومان"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "X" +
                                    widget.socketData.orderItem[index].quantity
                                        .toString(),
                                style: const TextStyle(
                                  backgroundColor: YellowColor,
                                  fontFamily: "iransans",
                                ),
                              ),
                              Text((widget.socketData.orderItem[index]
                                              .productUnitPrice! *
                                          widget.socketData.orderItem[index]
                                              .quantity)
                                      .toString() +
                                  " تومان"),
                            ],
                          ),
                          const Divider(
                            thickness: 1,
                            color: BlackColor,
                          ),
                        ],
                      );
                    }),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("توضیحات:"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(widget.socketData.order.description!),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("مبلغ قابل پرداخت: ",
                    style: TextStyle(
                        fontFamily: "iransans", fontWeight: FontWeight.bold)),
                Text(_orderViewModel.totalPrice.toString(),
                    style: const TextStyle(
                        fontFamily: "iransans", fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}