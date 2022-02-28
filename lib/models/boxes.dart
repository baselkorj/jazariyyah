import 'package:hive/hive.dart';
import 'package:jazariyyah/models/db.dart';

class Boxes {
  static Box<Bookmark> getBookmarks() => Hive.box<Bookmark>('bookmarks');
}
