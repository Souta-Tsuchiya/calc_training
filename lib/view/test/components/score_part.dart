import 'package:calc_training/view_model/test_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScorePart extends StatelessWidget {
  final int numOfQuestions;

  ScorePart({required this.numOfQuestions});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TestScreenViewModel>();

    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
      child: Table(
        children: [
          TableRow(children: [
            Center(child: Text("のこり問題数", style: TextStyle(fontSize: 16.0))),
            Center(child: Text("正解数", style: TextStyle(fontSize: 16.0))),
            Center(child: Text("正答率", style: TextStyle(fontSize: 16.0))),
          ]),
          TableRow(children: [
            Center(child: Text(viewModel.numberOfRemaining.toString(), style: TextStyle(fontSize: 24.0))),
            Center(child: Text(viewModel.numberOfCorrect.toString(), style: TextStyle(fontSize: 24.0))),
            Center(child: Text(viewModel.correctRate.toString(), style: TextStyle(fontSize: 24.0))),
          ]),
        ],
      ),
    );
  }

}
