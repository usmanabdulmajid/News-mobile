abstract class LocalStorage<E> {
  bool containKey(String key);

  E? read(String key);

  Future<void> write(String key, E value);

  Future<void> remove(String key);

  Future<void> clear();

  bool get isEmpty;

  Iterable<MapEntry<String, E>> get entries;

  List<E> get list;

  Stream<E> stream();
}
