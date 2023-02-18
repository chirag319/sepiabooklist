import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sepiabooklist/feature/view_book_home.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List',
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],/// This will Set Strings for Localizations
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ViewBookHomePage(),
    );
  }
}
