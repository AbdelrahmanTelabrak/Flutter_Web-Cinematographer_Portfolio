import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils.dart';

SliverToBoxAdapter footerSection({required double padding}) {
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          // ======= Contact =======
          const Text(
            'CONNECT',
            textAlign: TextAlign.start,
            style: AppTextStyles.phone_footerTitle,
          ),
          const SizedBox(height: 10),
          const Text(
            "ahmed3bdelrahim@gmail.com",
            textAlign: TextAlign.start,
            style: AppTextStyles.phone_footerBody,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  redirectToUrl('https://www.instagram.com/ahmed_abdelrahim_hassan?igsh=NTI4NGZiOXp3NG5s');
                },
                icon: Image.asset('assets/images/instagram_icon.png', color: Colors.grey, width: 24, height: 24),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    ),
  );
}
Widget aboutSection(){
  return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'ABOUT',
          textAlign: TextAlign.start,
          style: AppTextStyles.phone_footerTitle,
        ),
        SizedBox(height: 20),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          textAlign: TextAlign.start,
          style: AppTextStyles.phone_footerBody,
        ),
        SizedBox(height: 40),
      ],
    );
}

