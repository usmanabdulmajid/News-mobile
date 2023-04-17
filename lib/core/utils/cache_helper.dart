import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:news_mobile/core/constants/constants.dart';
import 'package:news_mobile/core/model/settings.dart';
import 'package:news_mobile/core/model/user.dart';
import 'package:news_mobile/core/service/local_db/hive_storage.dart';

import '../service/local_db/local_storage.dart';

class CacheHelper {
  static late final LocalStorage<User> _user;
  static late final LocalStorage<Settings> _settings;
  static const _secureStorage = FlutterSecureStorage();

  static Future<void> openAllBox() async {
    Hive
      ..registerAdapter(SettingsAdapter())
      ..registerAdapter(UserAdapter());
    _settings = HiveStorage<Settings>(await Hive.openBox(kSettingsBox));
    final encryprionKey = await _secureStorage.read(key: 'key');
    if (encryprionKey == null) {
      final key = Hive.generateSecureKey();
      await _secureStorage.write(
        key: 'key',
        value: base64UrlEncode(key),
      );
    }
    final key = await _secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);
    _user = HiveStorage<User>(
      await Hive.openBox(
        kUserBox,
        encryptionCipher: HiveAesCipher(encryptionKey),
      ),
    );
  }

  static set user(User? user) {
    _user.write('user', user!);
  }

  static User? get user => _user.read('user');

  static set settings(Settings? settings) {
    _settings.write('settings', settings!);
  }

  static Settings? get settings => _settings.read('settings');

  static Future<void> clearBoxes() async {
    await _user.clear();
    await _settings.clear();
  }
}
