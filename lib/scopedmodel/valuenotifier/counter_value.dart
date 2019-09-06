import 'package:flutter/foundation.dart';
import 'package:spike_rebuild_flutter/repository/count_repository.dart';

import 'loading_value.dart';

class CounterValue {
  final CountRepository _repository;
  final LoadingValue _loadingValue;

  CounterValue(this._repository, this._loadingValue);

  final valueNotifier = ValueNotifier<int>(0);

  void incrementCounter() async {
    _loadingValue.loading(true);
    var increaseCount = await _repository.fetch().whenComplete(() {
      _loadingValue.loading(false);
    });
    valueNotifier.value += increaseCount;
  }
}

class CounterValue2 with ChangeNotifier {
  final CountRepository _repository;
  final LoadingValue2 _loadingValue;

  CounterValue2(this._repository, this._loadingValue);

  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() async {
    _loadingValue.loading(true);
    var increaseCount = await _repository.fetch().whenComplete(() {
      _loadingValue.loading(false);
    });
    _counter += increaseCount;
    notifyListeners();
  }
}
