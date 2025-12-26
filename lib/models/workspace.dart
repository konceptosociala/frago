import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace.freezed.dart';
part 'workspace.g.dart';

@freezed
abstract class Workspace with _$Workspace {
  const Workspace._();

  const factory Workspace({
    required Option<String> postsFolder,
    required Option<String> imagesFolder,
    required bool cloned,
  }) = _Workspace;

  factory Workspace.initial() => Workspace(
    postsFolder: None(),
    imagesFolder: None(),
    cloned: false,
  );

  factory Workspace.fromJson(
    Map<String, dynamic> json
  ) => _$WorkspaceFromJson(json);

  bool isInitialized() 
    => cloned 
    && postsFolder.isSome() 
    && imagesFolder.isSome();
}
