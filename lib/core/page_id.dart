enum PageId {
  posts,
  workspace,
  media,
  profile;

  static PageId fromIndex(int index) => switch (index) {
    0 => PageId.posts,
    1 => PageId.workspace,
    3 => PageId.media,
    4 => PageId.profile,
    _ => throw ArgumentError('Invalid index for PageId: $index')
  };

  int toIndex() => switch (this) {
    PageId.posts      => 0,
    PageId.workspace  => 1,
    PageId.media      => 3,
    PageId.profile    => 4,
  };

  @override
  String toString() => switch (this) {
    PageId.posts      => 'Posts',
    PageId.workspace  => 'Workspace',
    PageId.media      => 'Media',
    PageId.profile    => 'Profile'
  };
}
