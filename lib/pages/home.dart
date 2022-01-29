import 'package:flutter/material.dart';
import 'package:jazariyyah/content/strings.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(chapters.values.toList()[index]),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.book), label: ui['chapters']),
          BottomNavigationBarItem(
              icon: const Icon(Icons.edit), label: ui['notes']),
          BottomNavigationBarItem(
              icon: const Icon(Icons.bookmark), label: ui['bookmarks'])
        ],
      ),
    );
  }
}
