import 'package:calc_training/view_model/test_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerCheckButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TestScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: Text("こたえ合わせ", style: TextStyle(fontSize: 20.0),),
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
          ),
          onPressed: viewModel.isAnswerCheckButtonEnabled ? () => _answerCheck(context) : null,
        ),
      ),
    );
  }

  _answerCheck(BuildContext context) {
    final viewModel = context.read<TestScreenViewModel>();
    if (viewModel.answerString == "" || viewModel.answerString == "-") return;
    viewModel.answerCheck();
  }
}
