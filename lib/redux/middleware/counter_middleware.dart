import 'package:redux/redux.dart';
import 'package:spike_rebuild_flutter/redux/action/actions.dart';
import 'package:spike_rebuild_flutter/redux/state/app_state.dart';
import 'package:spike_rebuild_flutter/repository/count_repository.dart';

List<Middleware<AppState>> counterMiddleware(
  CountRepository repository,
) {
  return [
    TypedMiddleware<AppState, CountUpAction>(_fetch(repository)),
  ];
}

void Function(
  Store<AppState> store,
  CountUpAction action,
  NextDispatcher next,
) _fetch(
  CountRepository repository,
) {
  return (store, action, next) {
    next(action);
    next(LoadingAction());
    repository.fetch().then((increaseCount) {
      store.dispatch(CountUpSucceededAction(increaseCount));
    }).catchError((error) {
      print(error);
    }).whenComplete(() {
      next(LoadCompleteAction());
    });
  };
}
