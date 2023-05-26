import 'package:flutter/material.dart';

import '../../../model/entity/orderItem.dart';
import '../../../model/entity/socketData.dart';
import '../../../utils/constants.dart';

class CurrentOrder extends StatelessWidget {
  final SocketData socketData;
  const CurrentOrder({Key? key, required this.socketData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            socketData.order.tableNumber.toString() + "میز:",
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
                    itemCount: socketData.orderItem.length,
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
                              Text(socketData.orderItem[index].productTitle!),
                              Text(socketData.orderItem[index].productUnitPrice
                                  .toString()),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(socketData.orderItem[index].quantity
                                  .toString()),
                              Text((socketData
                                          .orderItem[index].productUnitPrice! *
                                      socketData.orderItem[index].quantity)
                                  .toString()),
                            ],
                          ),
                        ],
                      );
                    }),
                Row(children: [
                  Text(socketData.order.description!),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("مبلغ قابل پرداخت: "),
                    Text("order.total"),
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
