import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jazariyyah/global.dart';
import 'package:jazariyyah/widgets/bottom_nav_var.dart';
import 'package:jazariyyah/widgets/chapters_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("متن الجزرية"),
        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ValueListenableBuilder<int>(
          valueListenable: selectedPage,
          builder: (context, value, _) {
            if (selectedPage.value == 0) {
              return const ChaptersList();
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
