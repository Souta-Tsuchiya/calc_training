import 'package:calc_training/view_model/test_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalcButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 62.0, right: 8.0, left: 8.0),
        child: Table(
          children: [
            TableRow(
              children: [
                _calcButton(context, "7"),
                _calcButton(context, "8"),
                _calcButton(context, "9"),
              ],
            ),
            TableRow(
              children: [
                _calcButton(context, "4"),
                _calcButton(context, "5"),
                _calcButton(context, "6"),
              ],
            ),
            TableRow(
              children: [
                _calcButton(context, "1"),
                _calcButton(context, "2"),
                _calcButton(context, "3"),
              ],
            ),
            TableRow(
              children: [
                _calcButton(context, "0"),
                _calcButton(context, "-"),
                _calcButton(context, "C"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _calcButton(BuildContext context, String calcButtonText) {
    final viewModel = context.read<TestScreenViewModel>();

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        child: Text(
          calcButtonText,
          style: TextStyle(fontSize: 28.0),
        ),
        style: ElevatedButton.styleFrom(primary: Colors.grey),
        onPressed: viewModel.isCalcButtonsEnabled ? () => _inputAnswer(context, calcButtonText) : null,
      ),
    );
  }

  _inputAnswer(BuildContext context, String calcButtonText) {
    final viewModel = context.read<TestScreenViewModel>();

    viewModel.inputAnswer(calcButtonText);
  }
}
