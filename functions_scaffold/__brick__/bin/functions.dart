import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:waterbase_functions/endpoints/hello.dart' as i1;

void main(List<String> args) {
  final address = InternetAddress.anyIPv6;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final pipeline = const Pipeline();
  final router = Router();
  final handler = Cascade().add(pipeline.addHandler(router)).handler;

  router.all(i1.function.path, i1.function.onRequest);

  serve(handler, address, port);
}
