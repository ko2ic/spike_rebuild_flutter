import 'package:flutter/foundation.dart';

class LoadingValue {
  final isLoading = ValueNotifier<bool>(false);

  loading(bool isLoading) {
    this.isLoading.value = isLoading;
  }
}

class LoadingValue2 with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  loading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
