import 'package:flutter/material.dart';
import 'package:jazariyyah/pages/chapter_view.dart';
import 'package:jazariyyah/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar', '')],
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'almarai'),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomePage()),
    );
  }
}
