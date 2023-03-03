import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

void main(List<String> args) {
  final address = InternetAddress.anyIPv6;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final pipeline = const Pipeline();
  final router = Router();
  final handler = Cascade().add(pipeline.addHandler(router)).handler;

  serve(handler, address, port);
}
