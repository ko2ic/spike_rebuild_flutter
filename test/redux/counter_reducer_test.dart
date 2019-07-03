import 'package:redux/redux.dart';
import 'package:spike_rebuild_flutter/redux/action/actions.dart';
import 'package:spike_rebuild_flutter/redux/reducer/app_state_reducer.dart';
import 'package:spike_rebuild_flutter/redux/state/app_state.dart';
import 'package:test/test.dart';

main() {
  group('counterReducerのテスト', () {
    test('Stateのcounterが1の状態で、ActionのincreaseCountが1の場合', () async {
      final store = Store<AppState>(
        appStateReducer,
        initialState: const AppState(counter: 10),
      );

      const increaseCount = 1;
      store.dispatch(const CountUpSucceededAction(increaseCount));

      expect(store.state.counter, 11);
    });
  });
}
