import 'package:flutter/material.dart';
import 'package:jazariyyah/content/strings.dart';
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
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: ChaptersList(),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
