import 'package:mockito/mockito.dart';
import 'package:spike_rebuild_flutter/bloc/counter_bloc.dart';
import 'package:spike_rebuild_flutter/bloc/loading_bloc.dart';
import 'package:spike_rebuild_flutter/repository/count_repository.dart';
import 'package:test/test.dart';

class _MockCountRepository extends Mock implements CountRepository {}

class _MockLoadingBloc extends Mock implements LoadingBloc {}

main() {
  group('incrementCounter()のテスト', () {
    test('fetch()の戻りが1の場合', () async {
      var repository = _MockCountRepository();
      var loadingBloc = _MockLoadingBloc();

      var target = CounterBloc(repository, loadingBloc);

      when(loadingBloc.loading(true)).thenReturn(null);
      when(repository.fetch()).thenAnswer((_) => Future.value(1));
      when(loadingBloc.loading(false)).thenReturn(null);

      target.incrementCounter();

      await untilCalled(loadingBloc.loading(false));

      target.value.listen(
        expectAsync1(
          (actual) {
            expect(actual, inInclusiveRange(0, 1));
          },
          count: 2,
        ),
      );

      verifyInOrder([
        loadingBloc.loading(true),
        repository.fetch(),
        loadingBloc.loading(false),
      ]);
    });
  });
}
