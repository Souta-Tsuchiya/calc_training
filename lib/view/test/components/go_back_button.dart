import 'package:calc_training/view_model/test_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TestScreenViewModel>();

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 40.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: Text("もどる", style: TextStyle(fontSize: 20.0)),
          style: ElevatedButton.styleFrom(
            primary: Colors.indigo
          ),
          onPressed: viewModel.isBackButtonEnabled ? () => Navigator.pop(context) : null,
        ),
      ),
    );
  }
}
