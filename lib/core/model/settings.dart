import 'package:hive/hive.dart';

class Settings {
  Settings({
    this.firstLaunch = true,
    this.hasUserData = false,
  });
  bool firstLaunch;
  bool hasUserData;

  Settings copyWith({
    bool? firstLaunch,
    bool? hasUserData,
  }) {
    return Settings(
      firstLaunch: firstLaunch ?? this.firstLaunch,
      hasUserData: hasUserData ?? this.hasUserData,
    );
  }

  @override
  String toString() {
    return 'Settings(firstLaunch: $firstLaunch, hasUserData: $hasUserData)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Settings &&
        other.firstLaunch == firstLaunch &&
        other.hasUserData == hasUserData;
  }

  @override
  int get hashCode {
    return firstLaunch.hashCode ^ hasUserData.hashCode;
  }
}

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return Settings(
      firstLaunch: fields[0] as bool,
      hasUserData: fields[1] as bool,
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.firstLaunch)
      ..writeByte(1)
      ..write(obj.hasUserData);
  }
}
