import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  const Post._();

  const factory Post({
    required String title, 
    required String description,
    @Default(false) bool selected,
  }) = _Post;

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
