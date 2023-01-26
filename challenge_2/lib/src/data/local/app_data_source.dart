import '../models/on_boarding_model.dart';

class AppDataSource {
  static final AppDataSource _instance = AppDataSource._();

  AppDataSource._();

  factory AppDataSource() => _instance;

  List<OnBoardingModel> get onBoardingItems => [
        for (var i = 0; i < 4; i++)
          OnBoardingModel(
            title: 'Read the article you want instantly',
            description:
                'You can read thousands of article on One Pice Club, save them in the application and there them with your loved ones.',
          ),
      ];
}
