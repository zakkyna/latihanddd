import 'package:dio/dio.dart';

abstract class INetworkService {
  Future<Response> getHTTP({
    required String path,
  });
}
