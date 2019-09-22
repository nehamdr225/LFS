import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _storage = new FlutterSecureStorage();

getValue(key) async {
  try {
    return await _storage.read(key: key);
  } catch (err) {
    return null;
  }
}

savekeyVal(key, value) async {
  try {
    await _storage.write(key: key, value: value);
  } catch (err) {
    throw err;
  }
}

delKeyVal(key) async {
  try {
    await _storage.delete(key: key);
  } catch (err) {
    throw err;
  }
}
