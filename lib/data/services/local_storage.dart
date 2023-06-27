import 'dart:async';

import 'package:hive/hive.dart';

abstract class LocalStorage {
  static Future<List<R>?> getData<R>(String path) async {
    final box = await Hive.openBox('local_cache');
    final data = box.get(path);
    if (data != null && data.isNotEmpty) return List<R>.from(data);
    return null;
  }


  static void saveData<R>(String path, data) {
    Hive.openBox('local_cache').then((box) => box.put(path, data));
  }
}
