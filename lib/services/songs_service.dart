import 'package:flutter/material.dart';
import 'package:music_player/models/song_model.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';

class SongsService with ChangeNotifier {
  Future<SongsModel?> getSongsList() async {
    Uri url = Uri.parse('${Environment.apiUrl}songs/');
    final resp =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    SongsModel songsList = songsModelFromJson(resp.body);
    return songsList;
  }
}
