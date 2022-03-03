import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jazariyyah/content/strings.dart';
import 'package:jazariyyah/models/db.dart';
import 'package:jazariyyah/pages/chapter_view.dart';
import 'package:jazariyyah/models/global.dart' as global;

class BookmarksList extends StatelessWidget {
  const BookmarksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    global.updateBookmarksBox();

    return ValueListenableBuilder<Box<Bookmark>>(
        valueListenable: global.bookmarks,
        builder: (context, box, _) {
          List<Bookmark> currentBookmarks = box.values.toList();

          if (currentBookmarks.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10.0),
              itemCount: currentBookmarks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    trailing: FractionallySizedBox(
                      heightFactor: 0.65,
                      child: Container(
                          width: 40,
                          child: Center(
                            child: Text(
                              '${currentBookmarks[index].page}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red[300],
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0)))),
                    ),
                    title:
                        Text("  ${chapters[currentBookmarks[index].chapter]}"),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChapterView(
                                currentChapter: currentBookmarks[index].chapter,
                                page: currentBookmarks[index].page,
                              )),
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        });
  }
}
