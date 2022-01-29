import 'package:flutter/material.dart';

class ChapterView extends StatefulWidget {
  const ChapterView({Key? key}) : super(key: key);

  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Container(
              height: 250,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 35.0,
              width: 70.0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
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
                ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.arrow_left,
                      size: 64.0,
                    )),
                ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.arrow_right,
                      size: 64.0,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
