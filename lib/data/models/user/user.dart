import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User extends HiveObject with _$User {
  User._();

  @HiveType(typeId: 5)
  factory User({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String username,
    @HiveField(3) required String email,
    @HiveField(4) required Address address,
    @HiveField(5) required String phone,
    @HiveField(6) required String website,
    @HiveField(7) required Company company,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address extends HiveObject with _$Address {
  Address._();

  @HiveType(typeId: 6)
  factory Address({
    @HiveField(0) required String street,
    @HiveField(1) required String suite,
    @HiveField(2) required String city,
    @HiveField(3) required String zipcode,
    @HiveField(4) required Geo geo,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Geo extends HiveObject with _$Geo {
  Geo._();

  @HiveType(typeId: 7)
  factory Geo({
    @HiveField(0)  required String lat,
    @HiveField(1)  required String lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}

@freezed
class Company extends HiveObject with _$Company {
  Company._();

  @HiveType(typeId: 8)
  factory Company({
    @HiveField(0) required String name,
    @HiveField(1) required String catchPhrase,
    @HiveField(2) required String bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
