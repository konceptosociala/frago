import 'package:simplegit/simplegit.dart';

void main() {
  var version = Git.version();
  print('Git version: $version');
}
