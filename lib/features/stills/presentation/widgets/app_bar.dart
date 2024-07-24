import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

SliverAppBar mainSliverAppBar(BuildContext context) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
    backgroundColor: scaffoldBackground,
    expandedHeight: 150,
    pinned: true,
    title: InkWell(
      onTap: () {
        context.pushReplacement(LATEST_PAGE);
        print('ON tap');
      },
      child: const Text(
        'Ahmed Abdelreheem - Cinematographer',
        style: AppTextStyles.phone_headline1,
      ),
    ),
    centerTitle: true,
    flexibleSpace: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // 150 is the expanded height, subtracting the status bar height.
        var top = constraints.biggest.height;
        return FlexibleSpaceBar(
          title: InkWell(
            onTap: () {
              context.pushReplacement(LATEST_PAGE);
              print('ON tap');
            },
            child: Opacity(
              opacity: top > kToolbarHeight + 20 ? 1.0 : 0.0,
              child: const Text(
                'Ahmed Abdelreheem - Cinematographer',
                style: AppTextStyles.phone_headline2,
              ),
            ),
          ),
          centerTitle: true,
          expandedTitleScale: 1,
          collapseMode: CollapseMode.pin,
          background: Container(
            color: const Color(0xff101720),
          ),
        );
      },
    ),
  );
}

Widget projectDetailsSliverAppBar(BuildContext context, {required String bannerImageUrl}) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
    backgroundColor: scaffoldBackground,
    expandedHeight: 150,
    pinned: true,
    title: InkWell(
      onTap: () {
        context.pushReplacement(LATEST_PAGE);
        print('ON tap');
      },
      child: const Text(
        'Ahmed Abdelreheem - Cinematographer',
        style: AppTextStyles.phone_headline2,
      ),
    ),
    centerTitle: true,
    flexibleSpace: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // 150 is the expanded height, subtracting the status bar height.
        var top = constraints.biggest.height;
        return FlexibleSpaceBar(
          centerTitle: true,
          expandedTitleScale: 1,
          collapseMode: CollapseMode.pin,
          background: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: bannerImageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.5), // Adjust the opacity to control the fade effect
              ),
            ],
          ),
        );
      },
    ),
  );
}
