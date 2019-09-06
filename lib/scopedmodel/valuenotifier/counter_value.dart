import 'package:flutter/foundation.dart';
import 'package:spike_rebuild_flutter/repository/count_repository.dart';

import 'loading_value.dart';

class CounterValue extends ValueNotifier<int> {
  final CountRepository _repository;
  final LoadingValue _loadingValue;

  final int _value;

  CounterValue(this._value, this._repository, this._loadingValue) : super(_value);

  void incrementCounter() async {
    _loadingValue.loading(true);
    var increaseCount = await _repository.fetch().whenComplete(() {
      _loadingValue.loading(false);
    });
    super.value += increaseCount;
  }
}
