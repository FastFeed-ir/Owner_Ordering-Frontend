import 'package:flutter/material.dart';
import 'package:owner_ordering_frontend/view_model/orderItem_viewmodel.dart';

import '../../../model/entity/orderItem.dart';
import '../../../model/entity/socketData.dart';
import '../../../utils/constants.dart';
import '../../../view_model/order_viewmodel.dart';
import './orders.dart' as ord;

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
  final _orderItemViewModel = OrderItemViewModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: BoxDecoration(border: Border.all(width: 5),borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.fromLTRB(5,10,5,10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "میز: "+widget.socketData.order.tableNumber.toString(),
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontFamily: "iransans",
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.fromLTRB(5,5,5,5),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: widget.socketData.orderItem.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                                  .toString()+" تومان"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("X"+widget.socketData.orderItem[index].quantity
                                  .toString(),style: TextStyle(backgroundColor: YellowColor,fontFamily: "iransans",),),
                              Text((widget.socketData.orderItem[index]
                                          .productUnitPrice! *
                                      widget
                                          .socketData.orderItem[index].quantity)
                                  .toString()+" تومان"),
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
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child:
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("توضیحات:"),
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
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("مبلغ قابل پرداخت: ",style: TextStyle(fontFamily: "iransans",fontWeight: FontWeight.bold)),
                Text(_orderViewModel.totalPrice.toString(),style: TextStyle(fontFamily: "iransans",fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: YellowColor,
                      fixedSize: Size.fromWidth(100),
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
                      print(ord.passedOrders.length);
                      ord.passedOrders.add(widget.socketData);
                      print(ord.passedOrders.length);
                      ord.currentOrders.remove(widget.socketData);
                    }),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: YellowColor,
                      fixedSize: Size.fromWidth(100),
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
                        _orderViewModel.deleteOrder(widget.socketData.order);
                        for(var i in widget.socketData.orderItem){
                          _orderItemViewModel.deleteOrderItem(i);
                        }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
