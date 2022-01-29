import 'package:flutter/material.dart';
import 'package:jazariyyah/content/strings.dart';
import 'package:jazariyyah/pages/chapter_view.dart';

class ChaptersList extends StatelessWidget {
  const ChaptersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(chapters.values.toList()[index]),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChapterView()),
              ),
            ),
          );
        });
  }
}
