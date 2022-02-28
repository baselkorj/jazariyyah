import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jazariyyah/models/boxes.dart';
import 'package:jazariyyah/models/db.dart';

ValueListenable<Box<Bookmark>> bookmarks = Boxes.getBookmarks().listenable();

void updateBookmarksBox() {
  bookmarks = Boxes.getBookmarks().listenable();
}

final selectedPage = ValueNotifier<int>(0);

List<int> chapterPages = [
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
  4,
];
