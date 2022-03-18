// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'test.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Echo$Query$IdResult _$Echo$Query$IdResultFromJson(Map<String, dynamic> json) =>
    Echo$Query$IdResult()..id = json['id'] as String;

Map<String, dynamic> _$Echo$Query$IdResultToJson(
        Echo$Query$IdResult instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

Echo$Query _$Echo$QueryFromJson(Map<String, dynamic> json) => Echo$Query()
  ..echo = json['echo'] == null
      ? null
      : Echo$Query$IdResult.fromJson(json['echo'] as Map<String, dynamic>);

Map<String, dynamic> _$Echo$QueryToJson(Echo$Query instance) =>
    <String, dynamic>{
      'echo': instance.echo?.toJson(),
    };

Echom$Mutation$IdResult _$Echom$Mutation$IdResultFromJson(
        Map<String, dynamic> json) =>
    Echom$Mutation$IdResult()..id = json['id'] as String;

Map<String, dynamic> _$Echom$Mutation$IdResultToJson(
        Echom$Mutation$IdResult instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

Echom$Mutation _$Echom$MutationFromJson(Map<String, dynamic> json) =>
    Echom$Mutation()
      ..echom = json['echom'] == null
          ? null
          : Echom$Mutation$IdResult.fromJson(
              json['echom'] as Map<String, dynamic>);

Map<String, dynamic> _$Echom$MutationToJson(Echom$Mutation instance) =>
    <String, dynamic>{
      'echom': instance.echom?.toJson(),
    };
