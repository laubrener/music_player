import 'dart:convert';

SongsModel songsModelFromJson(String str) =>
    SongsModel.fromJson(json.decode(str));

String songsModelToJson(SongsModel data) => json.encode(data.toJson());

class SongsModel {
  final bool? ok;
  final List<Song>? response;

  SongsModel({
    this.ok,
    this.response,
  });

  factory SongsModel.fromRawJson(String str) =>
      SongsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SongsModel.fromJson(Map<String, dynamic> json) => SongsModel(
        ok: json["ok"],
        response:
            List<Song>.from(json["response"].map((x) => Song.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Song {
  final String title;
  final String artist;
  final String albumName;
  final int? intDuration;
  final String? genre;
  final String albumPhoto;
  final String? backgroundPhoto;
  final bool? isFavourite;
  final int? intTotalPlays;
  final String? releseDate;
  final String uid;

  Song({
    required this.title,
    required this.artist,
    required this.albumName,
    this.intDuration,
    this.genre,
    required this.albumPhoto,
    this.backgroundPhoto,
    this.isFavourite,
    this.intTotalPlays,
    this.releseDate,
    required this.uid,
  });

  factory Song.fromRawJson(String str) => Song.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        title: json["title"],
        artist: json["artist"],
        albumName: json["albumName"],
        intDuration: json["intDuration"] ?? 0,
        genre: json["genre"] ?? "",
        albumPhoto: json["albumPhoto"],
        backgroundPhoto: json["backgroundPhoto"] ?? "",
        isFavourite: json["isFavourite"] ?? false,
        intTotalPlays: json["intTotalPlays"] ?? 0,
        releseDate: json["releseDate"] ?? "",
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "artist": artist,
        "albumName": albumName,
        "intDuration": intDuration,
        "genre": genre,
        "albumPhoto": albumPhoto,
        "backgroundPhoto": backgroundPhoto,
        "isFavourite": isFavourite,
        "intTotalPlays": intTotalPlays,
        "releseDate": releseDate,
        "uid": uid,
      };
}
