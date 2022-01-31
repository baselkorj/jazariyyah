import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:jazariyyah/content/strings.dart';
import 'package:jazariyyah/global.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.book), label: ui['chapters']),
        BottomNavigationBarItem(
            icon: const Icon(Icons.edit), label: ui['notes']),
        BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark), label: ui['bookmarks'])
      ],
      selectedItemColor: Colors.red[400],
      currentIndex: selectedPage.value,
      onTap: (val) => setState(() {
        selectedPage.value = val;
      }),
    );
  }
}
