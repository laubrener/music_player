part of 'songs_bloc.dart';

@immutable
sealed class SongsEvent {}

class OnRefreshSongs extends SongsEvent {
  OnRefreshSongs();
}
