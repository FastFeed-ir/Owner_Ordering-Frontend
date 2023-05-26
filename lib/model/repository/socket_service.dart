import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../entity/socketData.dart';
import '../util/constants.dart';

class SocketService {
  static late StreamController<SocketData> _socketResponse;
  static late io.Socket _socket;
  static String _code = '';
  static Stream<SocketData> get getResponse =>
      _socketResponse.stream.asBroadcastStream();

  static void setCode(String code) {
    _code = code;
  }

  static void connectAndListen() {
    _socketResponse = StreamController<SocketData>();
    _socket = io.io(socketUrl);
    _socket.emit('join', _code);
    _socket.on('message', (data) {
      Map<String, dynamic> json = data['data'];
      SocketData socketData = SocketData.fromJson(json);
      _socketResponse.sink.add(socketData);
    });
  }

  void sendOrder(SocketData socketData) {
    _socket.emit('message', {'data': socketData.toJson(), 'code': _code});
  }

  static void dispose() {
    _socket.dispose();
    _socket.destroy();
    _socket.close();
    _socket.disconnect();
    _socketResponse.close();
  }
}
