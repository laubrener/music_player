import 'package:flutter/material.dart';
import 'package:music_player/pages/songs_page.dart';
import 'package:music_player/pages/music_player_page.dart';
import 'package:music_player/pages/login.dart';
import 'package:music_player/pages/register_page.dart';
import 'package:music_player/pages/loading_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  "songs": (_) => const SongsPage(),
  "music_player": (_) => const MusicPlayerPage(),
  "login": (_) => const LoginPage(),
  "register": (_) => const RegisterPage(),
  "loading": (_) => const LoadingPage(),
};
