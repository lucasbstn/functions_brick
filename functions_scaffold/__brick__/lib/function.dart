import 'package:dart_frog/dart_frog.dart';

class WaterbaseFunction {
  final String path;
  final Future<Response> Function(RequestContext context) onRequest;

  WaterbaseFunction({
    required this.path,
    required this.onRequest,
  });
}
