import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import '../../../../service_locator.dart';
import '../cubit/explore_cubit.dart';
import 'mobile/landing_mobile.dart';
import 'web/landing_web.dart';
import '../widgets/mobile_landing_drawer.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExploreCubit>(
      create: (_) => sl.get<ExploreCubit>()..loadExploreData(),
      child: Scaffold(
        endDrawer: const MobileLandingDrawer(),
        body: SafeArea(
          bottom: false,
          right: false,
          child: AdaptiveLayout(
            compact: const LandingMobile(),
            medium: const LandingMobile(),
            expanded: const LandingWeb(),
          ),
        ),
      ),
    );
  }
}
