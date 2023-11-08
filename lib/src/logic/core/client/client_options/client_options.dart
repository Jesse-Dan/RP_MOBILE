import 'package:dio/dio.dart';

class ClientOptions {
  final Dio dio;
  ClientOptions({required this.dio});

  static Options getOptions() => Options();
}