import 'package:redux/redux.dart';
import 'package:spike_rebuild_flutter/redux/action/actions.dart';

final counterReducer = combineReducers<int>([
  TypedReducer<int, CountUpSucceededAction>((state, action) {
    int increaseCount = action.increaseCount;
    return state + increaseCount;
  }),
]);
