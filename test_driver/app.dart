import 'package:flutter_driver/driver_extension.dart';
import 'package:spike_rebuild_flutter/main.dart' as app;

/// flutter drive --target=./test_driver/app.dartで起動

void main() {
  enableFlutterDriverExtension();
  app.main();
}
