class CountRepository {
  Future<int> fetch() {
    return Future.delayed(Duration(seconds: 1)).then((_) {
      return 1;
    });
  }
}
