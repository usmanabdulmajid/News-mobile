import 'package:hive/hive.dart';
import 'package:news_mobile/core/service/local_db/local_storage.dart';
import 'package:news_mobile/core/utils/logger.dart';

class HiveStorage<E> implements LocalStorage<E> {
  HiveStorage(this.box);
  final Box<E> box;
  @override
  Future<void> clear() async {
    await box.clear();
  }

  @override
  bool containKey(String key) {
    return box.containsKey(key);
  }

  @override
  Iterable<MapEntry<String, E>> get entries =>
      box.toMap().entries as Iterable<MapEntry<String, E>>;

  @override
  bool get isEmpty => box.isEmpty;

  @override
  E? read(String key) {
    _guard();
    return box.get(key);
  }

  @override
  Future<void> remove(String key) async {
    _guard();
    await box.delete(key);
  }

  @override
  Future<void> write(String key, value) async {
    _guard();
    if (box.containsKey(key)) {
      box.delete(key);
    }
    await box.put(key, value);
  }

  @override
  Stream<E> stream() => box.watch().map((event) => event.value);

  void _guard() {
    assert(box.isOpen, 'Box with name ${box.name} is not opened');
  }

  @override
  List<E> get list =>
      box.toMap().entries.toList().map((each) => each.value).toList();
}
