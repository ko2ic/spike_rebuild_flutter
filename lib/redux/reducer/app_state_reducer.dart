import 'package:spike_rebuild_flutter/redux/state/app_state.dart';

import 'counter_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    counter: counterReducer(state.counter, action),
  );
}
