import 'package:hive/hive.dart';
import 'package:news_mobile/core/constants/constants.dart';
import 'package:news_mobile/core/model/settings.dart';
import 'package:news_mobile/core/service/local_db/hive_storage.dart';

import '../service/local_db/local_storage.dart';

class CacheHelper {
  static late final LocalStorage<Settings> _settings;

  static Future<void> openAllBox() async {
    Hive.registerAdapter(SettingsAdapter());
    _settings = HiveStorage<Settings>(await Hive.openBox(kSettingsBox));
  }

  static set settings(Settings? settings) {
    _settings.write('settings', settings!);
  }

  static Settings? get settings => _settings.read('settings');

  static Future<void> clearBoxes() async {
    await _settings.clear();
  }
}
