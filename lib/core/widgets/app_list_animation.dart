import 'package:currencypro/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


class AppListAnimation extends StatelessWidget {
  const AppListAnimation({
    super.key,
    required this.position,
    required this.child,
    this.enable = true,
  });

  final bool enable;
  final int position;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: position,
      duration: Duration(milliseconds: enable ? 100 : 0),
      child: SlideAnimation(
        duration: Duration(
            milliseconds: enable ? AppConstants.slideAnimation : 0),
        child: FadeInAnimation(
          duration: Duration(
              milliseconds: enable ? AppConstants.fadInAnimation : 0),
          child: child,
        ),
      ),
    );
  }
}
