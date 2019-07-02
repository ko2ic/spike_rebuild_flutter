import 'package:spike_rebuild_flutter/repository/count_repository.dart';

class CountRepositoryStub implements CountRepository {
  @override
  Future<int> fetch() {
    return Future.value(10);
  }
}
