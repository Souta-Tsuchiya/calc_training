import 'package:calc_training/view_model/test_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/answer_check_button.dart';
import 'components/calc_buttons.dart';
import 'components/go_back_button.dart';
import 'components/question_part.dart';
import 'components/score_part.dart';

class TestScreen extends StatelessWidget {
  final int numOfQuestions;

  TestScreen({required this.numOfQuestions});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TestScreenViewModel>();
    Future(() {
      viewModel.initSound();
      viewModel.initQuestionPart();
      viewModel.initScorePart(numOfQuestions);
    });

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Selector<TestScreenViewModel, int>(
                  selector: (context, viewModel) => viewModel.numberOfRemaining,
                  builder: (context, numberOfRemaining, child) {
                    return ScorePart(
                      numOfQuestions: numOfQuestions,
                    );
                  },
                ),
                Selector<TestScreenViewModel, int>(
                  selector: (context, viewModel) => viewModel.questionLeft,
                  builder: (context, questionLeft, child) {
                    return QuestionPart();
                  },
                ),
                Selector<TestScreenViewModel, bool>(
                  selector: (context, viewModel) => viewModel.isCalcButtonsEnabled,
                  builder: (context, isCalcButtonsEnabled, child) {
                    return CalcButtons();
                  },
                ),
                Selector<TestScreenViewModel, bool>(
                  selector: (context, viewModel) => viewModel.isAnswerCheckButtonEnabled,
                  builder: (context, isAnswerCheckButtonEnabled, child) {
                    return AnswerCheckButton();
                  },
                ),
                Selector<TestScreenViewModel, bool>(
                  selector: (context, viewModel) => viewModel.isBackButtonEnabled,
                  builder: (context, isBackButtonEnabled, child) {
                    return GoBackButton();
                  },
                ),
              ],
            ),
            Selector<TestScreenViewModel, bool>(
              selector: (context, viewModel) => viewModel.isCorrectInCorrectImageEnabled,
              builder: (context, isCorrectInCorrectImageEnabled, child) {
                return _correctInCorrectImage(context);
              },
            ),
            _endMessage(context),
          ],
        ),
      ),
    );
  }

  Widget _correctInCorrectImage(BuildContext context) {
    final viewModel = context.read<TestScreenViewModel>();
    if (viewModel.isCorrectInCorrectImageEnabled == true) {
      if (viewModel.isAnswerCorrect) {
        return Center(child: Image.asset("assets/images/pic_correct.png"));
      } else {
        return Center(child: Image.asset("assets/images/pic_incorrect.png"));
      }
    } else {
      return Container();
    }
  }

  Widget _endMessage(BuildContext context) {
    final viewModel = context.read<TestScreenViewModel>();
    if (viewModel.isEndMessageEnabled == true) {
      return Center(
        child: Text(
          "テスト終了",
          style: TextStyle(fontSize: 60.0),
        ),
      );
    } else {
      return Container();
    }
  }
}
