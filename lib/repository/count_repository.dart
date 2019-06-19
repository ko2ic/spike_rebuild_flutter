class CountRepository {
  Future<int> fetch() {
    return Future.delayed(Duration(seconds: 3)).then((_) {
      return 1;
    });
  }
}
