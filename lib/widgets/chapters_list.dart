import 'package:flutter/material.dart';
import 'package:jazariyyah/content/strings.dart';
import 'package:jazariyyah/pages/chapter_view.dart';

class ChaptersList extends StatelessWidget {
  const ChaptersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        physics: const BouncingScrollPhysics(),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                  "${index != 0 && index != 17 ? "$index." : ""} ${chapters[index]}"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChapterView(
                          currentChapter: index,
                        )),
              ),
            ),
          );
        });
  }
}
