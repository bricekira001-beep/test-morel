import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const ChatApp());
}

/// Application principale de messagerie.
class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    const couleurRougeFonce = Color(0xFFC62828);

    return MaterialApp(
      title: 'ChatApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: couleurRougeFonce,
          primary: couleurRougeFonce,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: couleurRougeFonce,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
