import 'package:mockito/mockito.dart';
import 'package:spike_rebuild_flutter/repository/count_repository.dart';
import 'package:spike_rebuild_flutter/scopedmodel/counter_model.dart';
import 'package:spike_rebuild_flutter/scopedmodel/loading_model.dart';
import 'package:test_api/test_api.dart';

class _MockCountRepository extends Mock implements CountRepository {}

class _MockLoadingModel extends Mock implements LoadingModel {}

main() {
  group('incrementCounter()のテスト', () {
    test('fetch()の戻りが1の場合', () async {
      var repository = _MockCountRepository();
      var loadingModel = _MockLoadingModel();

      var target = CounterModel(repository, loadingModel);

      when(loadingModel.loading(true)).thenReturn(null);
      when(repository.fetch()).thenAnswer((_) => Future.value(1));
      when(loadingModel.loading(false)).thenReturn(null);

      target.incrementCounter();

      await untilCalled(loadingModel.loading(false));

      bool listenerCalled = false;
      var listener = () {
        expect(target.counter, 1);
        listenerCalled = true;
      };

      target.addListener(listener);

      await untilCalled(listener);

      expect(listenerCalled, true);

      verifyInOrder([
        loadingModel.loading(true),
        repository.fetch(),
        loadingModel.loading(false),
      ]);
    });
  });
}
