import 'package:dio/dio.dart';

const ip = "87.107.146.132";
const socketPort = "5000";
const apiServerPort = "8050";

const baseUrl = 'http://$ip:$apiServerPort/';
const socketUrl = 'http://$ip:$socketPort/';

final options = BaseOptions(
  baseUrl: baseUrl,
  validateStatus: (status) => true,
  connectTimeout: const Duration(seconds: 50),
  receiveTimeout: const Duration(seconds: 50),
  contentType: 'application/json',
  headers: {
    "Authorization": "Token de0f00e7167f66057f46b9816e6cc1d88f663fe8",
  },
);

final dio = Dio(options);
