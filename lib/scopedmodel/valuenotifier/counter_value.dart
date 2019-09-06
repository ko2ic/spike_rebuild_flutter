import 'package:flutter/foundation.dart';
import 'package:spike_rebuild_flutter/repository/count_repository.dart';

import 'loading_value.dart';

class CounterValue {
  final CountRepository _repository;
  final LoadingValue _loadingValue;

  CounterValue(this._repository, this._loadingValue);

  final value = ValueNotifier<int>(0);

  void incrementCounter() async {
    _loadingValue.loading(true);
    var increaseCount = await _repository.fetch().whenComplete(() {
      _loadingValue.loading(false);
    });
    value.value += increaseCount;
  }
}
