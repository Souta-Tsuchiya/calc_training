import 'dart:async';
import 'dart:math';

import 'package:calc_training/model/soundManager.dart';
import 'package:flutter/material.dart';

class TestScreenViewModel extends ChangeNotifier {
  final SoundManager soundManager;

  TestScreenViewModel({required this.soundManager});

  int _numOfQuestions = 0;
  int numberOfRemaining = 0;
  int numberOfCorrect = 0;
  int correctRate = 0;

  int questionLeft = 10;
  String operator = "+";
  int questionRight = 10;
  String answerString = "";

  bool isCalcButtonsEnabled = false;
  bool isAnswerCheckButtonEnabled = false;
  bool isBackButtonEnabled = false;
  bool isCorrectInCorrectImageEnabled = false;
  bool isEndMessageEnabled = false;

  bool isAnswerCorrect = false;

  Future<void> initScorePart(int numOfQuestions) async{
    _numOfQuestions = numOfQuestions;
    numberOfRemaining = numOfQuestions;
    numberOfCorrect = 0;
    correctRate = 0;
    notifyListeners();
  }

  Future<void> initSound() async{
    await soundManager.initSound();
    notifyListeners();
  }

  Future<void> initQuestionPart() async{
    setQuestion();
  }

  void setQuestion() {
    answerString = "";

    isCalcButtonsEnabled = true;
    isAnswerCheckButtonEnabled = true;
    isBackButtonEnabled = false;
    isCorrectInCorrectImageEnabled = false;
    isEndMessageEnabled = false;

    isAnswerCorrect = false;

    Random random = Random();
    questionLeft = random.nextInt(100) + 1;
    questionRight = random.nextInt(100) + 1;

    if(random.nextInt(2) == 0) {
      operator = "+";
    }else{
      operator = "-";
    }

    notifyListeners();
  }

  void inputAnswer(String calcButtonText) {
    if(calcButtonText == "C") {
      answerString = "";
      notifyListeners();
      return;
    }

    if(calcButtonText == "-") {
      if(answerString == "") {
        answerString = "-";
        notifyListeners();
      }
      return;
    }

    if(calcButtonText == "0") {
      if(answerString != "0" && answerString != "-") {
        answerString = answerString + calcButtonText;
        notifyListeners();
      }
      return;
    }

    if(answerString == "0") {
      answerString = calcButtonText;
      notifyListeners();
      return;
    }

    answerString = answerString + calcButtonText;
    notifyListeners();
  }

  void answerCheck() {
    isCalcButtonsEnabled = false;
    isAnswerCheckButtonEnabled = false;
    isBackButtonEnabled = false;
    isCorrectInCorrectImageEnabled = true;
    isEndMessageEnabled = false;

    var realAnswer;
    if(operator == "+") {
      realAnswer = questionLeft + questionRight;
    }else{
      realAnswer = questionLeft - questionRight;
    }

    numberOfRemaining -= 1;
    if(answerString == realAnswer.toString()) {
      isAnswerCorrect = true;
      numberOfCorrect += 1;
      soundManager.play(isAnswerCorrect);
    }else{
      isAnswerCorrect = false;
      soundManager.play(isAnswerCorrect);
    }
    correctRate = (numberOfCorrect / (_numOfQuestions - numberOfRemaining) * 100).toInt();

    if(numberOfRemaining == 0) {
      isCalcButtonsEnabled = false;
      isAnswerCheckButtonEnabled = false;
      isBackButtonEnabled = true;
      isCorrectInCorrectImageEnabled = true;
      isEndMessageEnabled = true;
    }else{
      Timer(Duration(seconds: 1), () => setQuestion());
    }

    notifyListeners();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    soundManager.dispose();
  }
}