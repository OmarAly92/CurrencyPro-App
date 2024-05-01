import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';

class HomeSliverAppbar extends StatelessWidget {
  const HomeSliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Home',
        style: AppTextStyle.textStyle23,
      ),
      primary: true,
    );
  }
}
