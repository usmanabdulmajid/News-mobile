import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_mobile/core/model/settings.dart';
import 'package:news_mobile/core/utils/cache_helper.dart';

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier() : super(Settings()) {
    final settings = CacheHelper.settings;
    if (settings == null) {
      _settings = Settings();
      CacheHelper.settings = _settings.copyWith(firstLaunch: false);
    } else {
      _settings = settings;
    }
    final user = CacheHelper.user;
    if (user == null) {
      final newSetting = CacheHelper.settings;
      _settings.hasUserData = false;
      CacheHelper.settings = newSetting!.copyWith(hasUserData: false);
    } else {
      final newSetting = CacheHelper.settings;
      _settings.hasUserData = true;
      CacheHelper.settings = newSetting!.copyWith(hasUserData: true);
    }
    state = _settings;
  }

  late Settings _settings;
  bool get firstLaunch => _settings.firstLaunch;
  bool get hasUserData => _settings.hasUserData;
  Settings get appsettings => _settings;
}
