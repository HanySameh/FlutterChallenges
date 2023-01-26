import 'package:challenge_2/src/view/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/assets.gen.dart';
import '../../bloc/splash_bloc/splash_bloc.dart';
import '../../bloc/splash_bloc/splash_event.dart';
import '../../bloc/splash_bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) =>
            RepositoryProvider.of<SplashBloc>(context)
              ..add(NavigateToEvent(context: context)),
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: ImageWidget(
                    assetName: Assets.img.background.splashBackground.path,
                  ),
                ),
                Center(
                  child: Assets.img.icons.logo.svg(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
