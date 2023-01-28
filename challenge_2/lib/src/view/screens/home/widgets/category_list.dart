import 'package:carousel_slider/carousel_slider.dart';
import 'package:challenge_2/src/configs/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../bloc/home_bloc/home_bloc.dart';
import '../../../../bloc/home_bloc/home_event.dart';
import '../../../../bloc/home_bloc/home_state.dart';
import '../../../widgets/shimmer.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) {
        if (previous.currentIndex != current.currentIndex) {
          currentIndex = current.currentIndex;
          return true;
        } else {
          return false;
        }
      },
      listener: (_, __) {},
      builder: (context, state) {
        late Widget result;
        if (state.status == HomeStatus.loading) {
          result = _categoryListLoadingState();
        }
        if (state.status == HomeStatus.success) {
          result = _categoryListSuccessState(context, state, currentIndex);
        }
        return result;
      },
    );
  }

  Widget _categoryListSuccessState(
      BuildContext context, HomeState state, int currentIndex) {
    final CarouselController carouselController = CarouselController();

    return CarouselSlider.builder(
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        scrollPhysics: const BouncingScrollPhysics(),
        viewportFraction: 0.7,
        aspectRatio: 1.3,
        disableCenter: true,
        initialPage: 0,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        padEnds: false,
        onPageChanged: (index, _) {
          context.read<HomeBloc>().add(HomeSliderPageChange(index: index));
        },
      ),
      carouselController: carouselController,
      itemCount: state.categories.length,
      itemBuilder: (context, index, realIndex) {
        double startMargin = (index == 0 || index == currentIndex) ? 32 : 8;

        double endMargin = 8;

        var category = state.categories[index];

        return Container(
          margin: EdgeInsetsDirectional.fromSTEB(startMargin, 0, endMargin, 8),
          child: Stack(
            children: [
              Positioned.fill(
                top: 100,
                right: 56,
                left: 56,
                bottom: 24,
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 22,
                        color: ColorName.categoryItemBoxShadowColor,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  image: DecorationImage(
                      image: AssetImage(
                        category.imageFileName,
                      ),
                      fit: BoxFit.cover),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      ColorName.largePostGradiantStartColor,
                      Colors.transparent
                    ],
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 32,
                bottom: 48,
                child: Text(
                  category.title,
                  style: AppTheme.lightTheme.textTheme.titleLarge!
                      .apply(color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _categoryListLoadingState() {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 32, 32, 16),
      child: const ShimmerWidget.rectangular(
        width: double.maxFinite,
        height: 300,
      ),
    );
  }
}
