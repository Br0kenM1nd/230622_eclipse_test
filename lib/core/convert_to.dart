import 'dart:isolate';

class ConvertTo<R> {
  const ConvertTo();

  Future<List<R>> list(List data, builder) async {
    return Isolate.run(() => data.map<R>((e) => builder(e)).toList());
  }

  Future<R> item(data, builder) async {
    return Isolate.run(() => builder(data));
  }
}
