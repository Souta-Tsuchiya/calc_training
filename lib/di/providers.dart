import 'package:calc_training/model/soundManager.dart';
import 'package:calc_training/view_model/home_screen_view_model.dart';
import 'package:calc_training/view_model/test_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<SoundManager>(create: (context) => SoundManager()),
];

List<SingleChildWidget> dependentModels = [];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeScreenViewModel>(
    create: (context) => HomeScreenViewModel(),
  ),
  ChangeNotifierProvider<TestScreenViewModel>(
    create: (context) => TestScreenViewModel(
      soundManager: context.read<SoundManager>(),
    ),
  ),
];
