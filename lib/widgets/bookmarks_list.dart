import 'package:flutter/material.dart';
import 'package:jazariyyah/global.dart';
import 'package:jazariyyah/content/strings.dart';
import 'package:jazariyyah/pages/chapter_view.dart';

class BookmarksList extends StatelessWidget {
  const BookmarksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: bookmarkedPages.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              trailing: FractionallySizedBox(
                heightFactor: 0.65,
                child: Container(
                    width: 40,
                    child: Center(
                      child: Text(
                        '${bookmarkedPages[index][1]}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)))),
              ),
              title: Text("  ${chapters[bookmarkedPages[index][0]]}"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChapterView(
                          currentChapter: bookmarkedPages[index][0],
                          page: bookmarkedPages[index][1],
                        )),
              ),
            ),
          );
        });
  }
}
