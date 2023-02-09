import 'package:calc_training/view/test/test_screen.dart';
import 'package:calc_training/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/drop_down_button_part.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print("端末の幅：$screenWidth, 高さ:$screenHeight");

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 36.0,
              ),
              Image.asset("assets/images/image_title.png"),
              const SizedBox(
                height: 32.0,
              ),
              const Text(
                "問題数を選択して「スタート」ボタンを押してください",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 80.0,
              ),
              // DropDownButtonPart(),
              Selector<HomeScreenViewModel, int>(
                selector: (BuildContext context, viewModel) => viewModel.dropDownValue,
                builder: (
                  BuildContext context,
                  dropDownValue,
                  child,
                ) {
                  return DropDownButtonPart();
                },
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.skip_next),
                    label: Text("スタート"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () => _openTestScreen(context),
                  ),
                ),
              ),
              const SizedBox(
                height: 56.0,
              ),
            ],
          ),
        ),
      )),
    );
  }

  _openTestScreen(BuildContext context) {
    final viewModel = context.read<HomeScreenViewModel>();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TestScreen(
          numOfQuestions: viewModel.dropDownValue,
        ),
      ),
    );
  }
}
