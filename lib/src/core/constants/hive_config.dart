import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

final userBox = Hive.box('user');
final cacheBox = Hive.box('cache');
final settingsBox = Hive.box('settings');
final devBox = Hive.box('dev');
// used for storing data that should persist even after logout
final persistsData = Hive.box('persistsData');

Future initHive() async {
  Uint8List encryptionKey = await getEncryptionKey();

  await Hive.initFlutter();
  await Hive.openBox('user', encryptionCipher: HiveAesCipher(encryptionKey));
  await Hive.openBox('cache', encryptionCipher: HiveAesCipher(encryptionKey));
  await Hive.openBox('settings', encryptionCipher: HiveAesCipher(encryptionKey));
  await Hive.openBox('dev', encryptionCipher: HiveAesCipher(encryptionKey));
  await Hive.openBox('localization', encryptionCipher: HiveAesCipher(encryptionKey));
  await Hive.openBox('persistsData', encryptionCipher: HiveAesCipher(encryptionKey));
}

Future<Uint8List> getEncryptionKey() async {
  const secureStorage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

  String? key = await secureStorage.read(key: 'hiveKey');

  if (key == null) {
    final newKey = Hive.generateSecureKey();
    await secureStorage.write(key: 'hiveKey', value: base64UrlEncode(newKey));
    return Uint8List.fromList(newKey);
  }
  return base64Url.decode(key);
}
