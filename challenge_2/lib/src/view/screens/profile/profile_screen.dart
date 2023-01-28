import 'package:challenge_2/src/bloc/profile_bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/profile_bloc/profile_bloc.dart';
import '../../../bloc/profile_bloc/profile_event.dart';
import 'widgets/profile_loading.dart';
import 'widgets/profile_success.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final outerFrameHeight = MediaQuery.of(context).size.height * 0.45;
    final innerFrameHeight = MediaQuery.of(context).size.height * 0.35;
    return BlocProvider(
      create: (BuildContext context) =>
          RepositoryProvider.of<ProfileBloc>(context)..add(ProfileStarted()),
      child: Scaffold(
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return ProfileLoadingWidget(
                innerFrameHeight: innerFrameHeight,
              );
            }
            if (state is ProfileSuccess) {
              _scrollController.addListener(
                () {
                  bool isScrolled = _scrollController.hasClients &&
                      _scrollController.offset > 56;
                  context.read<ProfileBloc>().add(
                        ProfileScrolled(
                          isScrolled: isScrolled,
                        ),
                      );
                },
              );

              return ProfileSuccessWidget(
                innerFrameHeight: innerFrameHeight,
                outerFrameHeight: outerFrameHeight,
                scrollController: _scrollController,
                state: state,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
