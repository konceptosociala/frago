class Post {
  String _title;
  String _description;
  String _summary;
  bool selected = false;

  Post(this._title, this._description) : _summary = _makeSummary(_description);

  String get title => _title;
  String get description => _description;
  String get summary => _summary;

  set title(String newTitle) {
    _title = newTitle;
  }

  set description(String newDescription) {
    _description = newDescription;
    _summary = _makeSummary(newDescription);
  }

  static String _makeSummary(String description) {
    return description.length > 100
        ? '${description.substring(0, 100)}...'
        : description;
  }
}

enum PostSorting {
  dateAscending,
  dateDescending,
  titleAscending,
  titleDescending,
}
