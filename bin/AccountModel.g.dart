// GENERATED CODE - DO NOT MODIFY BY HAND

part of AccountModel;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountFromJson(Map<String, dynamic> json) {
  return AccountModel(json['username'] as String, json['password'] as String);
}

Map<String, dynamic> _$AccountToJson(AccountModel instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password
    };
