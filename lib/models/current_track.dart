import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selectedSong;
  double offset = 0;
  void changeOffset(double offset) {
    this.offset = offset;
    notifyListeners();
  }

  void selectSong(Song? song) {
    selectedSong = song;
    notifyListeners();
  }
}
