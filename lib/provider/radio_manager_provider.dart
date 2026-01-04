import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioManagerProvider extends ChangeNotifier{
  String? currentUrl;
  bool isPlaying = false;
  double currentVolume = 2.0;
  AudioPlayer player = AudioPlayer();

  //! play
  Future<void> play(String url) async {
    if (url == currentUrl) {
      isPlaying ? await player.pause() : await player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentUrl = url;
      await player.play(UrlSource(url) , volume: currentVolume);
      isPlaying = true;
    }
    notifyListeners();
  }

  //! stop
  Future<void> stop()async{
    await player.stop();
    currentUrl = null;
    isPlaying = false;
    notifyListeners();
}

  //! mute
  Future<void> setVolume(double volume)async{
    currentVolume = volume;
    await player.setVolume(volume);
    notifyListeners();
  }
}
