import 'dart:isolate';

abstract class ConvertTo {
  const ConvertTo();

  static Future<List<R>> list<R>(List data, builder) async {
    return Isolate.run(() => data.map<R>((e) => builder(e)).toList());
  }

  static Future<R> item<R>(data, builder) async {
    return Isolate.run(() => builder(data));
  }
}
