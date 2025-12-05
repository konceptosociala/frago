enum ScreenId {
  posts,
  workspace,
  media,
  profile;

  static ScreenId fromIndex(int index) => switch (index) {
    0 => ScreenId.posts,
    1 => ScreenId.workspace,
    3 => ScreenId.media,
    4 => ScreenId.profile,
    _ => throw ArgumentError('Invalid index for ScreenId: $index')
  };

  int toIndex() => switch (this) {
    ScreenId.posts      => 0,
    ScreenId.workspace  => 1,
    ScreenId.media      => 3,
    ScreenId.profile    => 4,
  };

  @override
  String toString() => switch (this) {
    ScreenId.posts      => 'Posts',
    ScreenId.workspace  => 'Workspace',
    ScreenId.media      => 'Media',
    ScreenId.profile    => 'Profile'
  };
}
