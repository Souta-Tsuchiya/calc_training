import 'dart:io';

import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundManager {
  late Soundpool _soundPool;
  int correctSoundId = 0;
  int inCorrectSoundId = 0;

  Future<void> initSound() async{
    try{
      _soundPool = Soundpool.fromOptions();
      correctSoundId = await _loadSound("assets/sounds/sound_correct.mp3");
      inCorrectSoundId = await _loadSound("assets/sounds/sound_incorrect.mp3");
    }on IOException catch(e) {
      print("エラーの内容は：$e");
    }
  }

  Future<int> _loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => _soundPool.load(value));
  }

  void play(bool isAnswerCorrect) {
    if(isAnswerCorrect) {
      _soundPool.play(correctSoundId);
    }else{
      _soundPool.play(inCorrectSoundId);
    }

  }

  void dispose() {
    _soundPool.dispose();
  }


  
}