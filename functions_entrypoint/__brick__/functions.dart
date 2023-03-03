import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
{{#functions}}
import 'package:waterbase_functions/endpoints/{{file}}.dart' as {{alias}};
{{/functions}}


void main(List<String> args) async {
  final address = InternetAddress.anyIPv6;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final pipeline = const Pipeline();
  final router = Router();
  final handler = Cascade().add(pipeline.addHandler(router)).handler;

  {{#functions}}
  router.all({{alias}}.function.path, {{alias}}.function.onRequest);
  {{/functions}}

  final server = await serve(handler, address, port);
  print('\x1B[92m✓\x1B[0m Running on http://${server.address.host}:${server.port}');
  
}
