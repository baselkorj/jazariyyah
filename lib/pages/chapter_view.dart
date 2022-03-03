import 'package:flutter/material.dart';
import 'package:jazariyyah/content/strings.dart';
import 'package:jazariyyah/models/boxes.dart';
import 'package:jazariyyah/models/global.dart';
import 'package:jazariyyah/models/db.dart';
import 'package:jazariyyah/models/global.dart' as global;

class ChapterView extends StatefulWidget {
  final currentChapter;
  final page;

  const ChapterView({Key? key, this.currentChapter, this.page})
      : super(key: key);

  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  int currentPage = 1;
  int numberOfPages = 4;
  bool updated = false;

  @override
  Widget build(BuildContext context) {
    bool _bookmarked = false;

    if (!updated && widget.page != null) {
      currentPage = widget.page;
      updated = true;
    }

    final _tempBookmark = Bookmark()
      ..chapter = widget.currentChapter
      ..page = currentPage;

    if (bookmarks.value.values
        .where((bookmark) =>
            bookmark.chapter == _tempBookmark.chapter &&
            bookmark.page == _tempBookmark.page)
        .isNotEmpty) {
      _bookmarked = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(chapters[widget.currentChapter]),
        centerTitle: true,
        backgroundColor: Colors.red[300],
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (_bookmarked) {
                    final Bookmark _currentBookmark = bookmarks.value.values
                        .where((bookmark) =>
                            bookmark.page == currentPage &&
                            bookmark.chapter == widget.currentChapter)
                        .first;

                    deleteBookmark(_currentBookmark);
                  } else {
                    addBookmark(_tempBookmark);
                  }
                });
              },
              icon: _bookmarked
                  ? const Icon(Icons.bookmark_added)
                  : const Icon(Icons.bookmark_add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 420),
              child: AspectRatio(
                aspectRatio: 1280 / 720,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              AssetImage("images/chapters/1/$currentPage.png")),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              height: 35.0,
              width: 70.0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          '$currentPage',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[300],
                              fontSize: 16),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCDD2),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5.0),
                            topRight: Radius.circular(5.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          '$numberOfPages',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFEF9A9A),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentPage != 1
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.red.shade400)),
                        onPressed: () {
                          setState(() {
                            currentPage--;
                          });
                        },
                        child: const Icon(
                          Icons.arrow_left,
                          size: 64.0,
                        ))
                    : Container(),
                currentPage != numberOfPages
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.red.shade400)),
                        onPressed: () {
                          setState(() {
                            currentPage++;
                          });
                        },
                        child: const Icon(
                          Icons.arrow_right,
                          size: 64.0,
                        ))
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

void addBookmark(Bookmark bookmark) {
  final _bookmarks = Boxes.getBookmarks();
  _bookmarks.add(bookmark);
}

void deleteBookmark(Bookmark bookmark) {
  final _bookmarks = Boxes.getBookmarks();
  _bookmarks.delete(bookmark.key);
}
