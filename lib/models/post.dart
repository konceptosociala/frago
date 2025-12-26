import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
abstract class PostDesc with _$PostDesc {
  const PostDesc._();

  const factory PostDesc({
    required String title, 
    required String description,
    @Default(false) bool selected,
  }) = _PostDesc;

  String get summary => 
    description.length > 100
      ? '${description.substring(0, 100)}...'
      : description;
}

enum PostSorting {
  dateAscending,
  dateDescending,
  titleAscending,
  titleDescending,
}
