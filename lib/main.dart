import 'package:flutter/material.dart';
import 'package:music_player/theme/theme.dart';
import 'package:music_player/pages/music_player_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: myTheme,
        home: const MusicPlayerPage());
  }
}
