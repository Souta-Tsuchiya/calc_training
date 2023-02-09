import 'package:calc_training/view_model/test_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TestScreenViewModel>();

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 88.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                viewModel.questionLeft.toString(),
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                viewModel.operator,
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                viewModel.questionRight.toString(),
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "=",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Selector<TestScreenViewModel, String>(
                selector: (context, viewModel) => viewModel.answerString,
                builder: (context, answerString, child) {
                  return Text(
                    answerString,
                    style: TextStyle(fontSize: 48.0),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
