import 'package:redux/redux.dart';
import 'package:spike_rebuild_flutter/redux/action/count_up_action.dart';

final counterReducer = combineReducers<int>([
  TypedReducer<int, CountUpAction>((state, action) {
    int current = action.counter;
    return ++current;
  }),
]);
