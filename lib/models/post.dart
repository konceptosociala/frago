import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
abstract class PostDescr with _$PostDescr {
  const PostDescr._();

  const factory PostDescr({
    required String title, 
    required String description,
    @Default(false) bool selected,
  }) = _PostDescr;

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
