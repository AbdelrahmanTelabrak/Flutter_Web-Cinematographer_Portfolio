import 'package:ahmed_abdelrehim_portfolio/core/media_query_helper.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/bloc/stills_bloc.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/widgets/still_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/entity/project_catalogue.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHelper = MediaQueryHelper(context);
    return Scaffold(
      body: BlocBuilder<StillsBloc, StillsState>(
        builder: (context, state) {
          if (state is StillsLoading) {
            return const Center(
                child: CircularProgressIndicator(color: primaryColor));
          } else if (state is StillsSuccess) {
            print('IN BLOC BUILDER');
            for (var project in state.projects) {
              print(project.toString());
            }
            return CustomScrollView(
              slivers: [
                mainSliverAppBar(context),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQueryHelper.widthPercentage(12)),
                  sliver: SliverList.list(
                    children: const [
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Icon(Icons.horizontal_rule_sharp),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'SHORT FILMS',
                                style: AppTextStyles.phone_displayLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQueryHelper.widthPercentage(12)),
                  sliver: stillsSection(projects: state.projects),
                ),
                // SliverToBoxAdapter(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 32.0, vertical: 20.0),
                //     child: Align(
                //       alignment: AlignmentDirectional.centerStart,
                //       child: SizedBox(
                //         width: 130,
                //         child: OutlinedButton(
                //           onPressed: () {
                //             context.go(PORTFOLIO_PAGE);
                //           },
                //           style: OutlinedButton.styleFrom(
                //             side: const BorderSide(
                //                 width: 1.0, color: primaryColor),
                //             shape: const RoundedRectangleBorder(
                //               borderRadius: BorderRadius.zero,
                //             ),
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 12.0, vertical: 12.0),
                //           ),
                //           child: const Text(
                //             'VIEW PORTFOLIO',
                //             style: AppTextStyles.phone_buttonText,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // ============= FOOTER ===============
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
                footerSection(padding: mediaQueryHelper.widthPercentage(12)),
              ],
            );
          } else if (state is StillsError) {
            return Center(
                child: Text(
              state.message,
              style: AppTextStyles.phone_headline1,
            ));
          } else {
            return const Center(
                child: Text(
              'This page is unavailable right now',
              style: AppTextStyles.phone_headline1,
            ));
          }
        },
      ),
    );
  }

  SliverList stillsSection({required List<ProjectCatalogue> projects}) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: EdgeInsets.only(bottom: projects.length == 1 ? 400.0 : 10.0),
          child: StillItem(project: projects[index]),
        ),
        childCount: projects.length,
      ),
    );
  }
}
