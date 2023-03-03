import 'package:dart_frog/dart_frog.dart';

import '../function.dart';

final function = WaterbaseFunction(
  path: '/hello',
  onRequest: (context) async {
    return Response(
      body: '<h2>Hello World</h2>',
      headers: {'Content-Type': 'text/html'},
    );
  },
);
