import 'package:challenge_2/src/configs/app_theme.dart';
import 'package:challenge_2/src/view/widgets/button_widget.dart';
import 'package:challenge_2/src/view/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../gen/assets.gen.dart';
import '../../bloc/on_boarding_bloc/on_boarding_bloc.dart';
import '../../bloc/on_boarding_bloc/on_boarding_event.dart';
import '../../bloc/on_boarding_bloc/on_boarding_state.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) =>
          RepositoryProvider.of<OnBoardingBloc>(context)
            ..add(OnBoardingStarted()),
      child: Scaffold(
        backgroundColor: AppTheme.lightTheme.colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              _backgroundImage(),
              Container(
                height: height * 0.4,
                decoration: BoxDecoration(
                  color: AppTheme.lightTheme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
                  builder: (context, state) {
                    _pageController.addListener(() {
                      context.read<OnBoardingBloc>().add(
                            OnBoardingPageChanged(
                              pageController: _pageController,
                            ),
                          );
                    });
                    return Column(
                      children: [
                        _descriptionSlider(state),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 32,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmoothPageIndicator(
                                controller: _pageController,
                                count: 4,
                                effect: ExpandingDotsEffect(
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  activeDotColor:
                                      AppTheme.lightTheme.colorScheme.primary,
                                  dotColor: AppTheme
                                      .lightTheme.colorScheme.primary
                                      .withOpacity(0.1),
                                ),
                              ),
                              ButtonWidget(
                                width: 80,
                                height: 60,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                voidCallback: () {
                                  context.read<OnBoardingBloc>().add(
                                        OnBoardingNavigateTo(
                                          context: context,
                                          pageController: _pageController,
                                        ),
                                      );
                                },
                                child: Icon(
                                  state.isReachedMaxPage
                                      ? Icons.check
                                      : Icons.arrow_forward_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 32, bottom: 8),
        child: ImageWidget(
          assetName: Assets.img.background.onboardingBackground.path,
        ),
      ),
    );
  }

  Widget _descriptionSlider(OnBoardingState state) {
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: state.onBoardingItems.length,
        itemBuilder: (context, index) {
          var onBoardingItem = state.onBoardingItems[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onBoardingItem.title,
                  style: AppTheme.lightTheme.textTheme.headlineMedium,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  onBoardingItem.description,
                  style: AppTheme.lightTheme.textTheme.titleMedium!
                      .apply(fontSizeFactor: 0.9),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
