import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
{{#functions}}
import 'package:{{projectName}}/functions/{{file}}.dart' as {{alias}};
{{/functions}}


void main(List<String> args) {
  final address = InternetAddress.anyIPv6;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final pipeline = const Pipeline();
  final router = Router();
  final handler = Cascade().add(pipeline.addHandler(router)).handler;

  {{#functions}}
  router.all({{alias}}.function.path, {{alias}}.function.onRequest);
  {{/functions}}

  serve(handler, address, port);
}
