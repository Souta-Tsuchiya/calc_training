import 'package:calc_training/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownButtonPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> _menuItems = [];
    _menuItems
      ..add(DropdownMenuItem(value: 10, child: Text("10")))
      ..add(DropdownMenuItem(value: 20, child: Text("20")))
      ..add(DropdownMenuItem(value: 30, child: Text("30")));

    final viewModel = context.read<HomeScreenViewModel>();

    return DropdownButton(
      value: viewModel.dropDownValue,
      items: _menuItems,
      onChanged: (int? selectedValue) => _changeDropdownValue(context, selectedValue!),
    );
  }

  _changeDropdownValue(BuildContext context, int selectedValue) {
    final viewModel = context.read<HomeScreenViewModel>();
    viewModel.changeDropdownValue(selectedValue);
  }
}
