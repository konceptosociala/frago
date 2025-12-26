// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Workspace _$WorkspaceFromJson(Map<String, dynamic> json) => _Workspace(
  postsFolder: Option<String>.fromJson(
    json['postsFolder'],
    (value) => value as String,
  ),
  imagesFolder: Option<String>.fromJson(
    json['imagesFolder'],
    (value) => value as String,
  ),
  cloned: json['cloned'] as bool,
);

Map<String, dynamic> _$WorkspaceToJson(_Workspace instance) =>
    <String, dynamic>{
      'postsFolder': instance.postsFolder.toJson((value) => value),
      'imagesFolder': instance.imagesFolder.toJson((value) => value),
      'cloned': instance.cloned,
    };
