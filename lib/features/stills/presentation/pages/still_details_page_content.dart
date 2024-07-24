import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_details.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/bloc/project_details_cubit.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/widgets/app_bar.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/widgets/project_still_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/media_query_helper.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/footer.dart';

class StillDetailsPageContent extends StatefulWidget {
  const StillDetailsPageContent({super.key});

  @override
  State<StillDetailsPageContent> createState() =>
      _StillDetailsPageContentState();
}

class _StillDetailsPageContentState extends State<StillDetailsPageContent> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final mediaQueryHelper = MediaQueryHelper(context);
    return Scaffold(
      body: BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(
                child: CircularProgressIndicator(color: primaryColor));
          } else if (state is DetailsSuccess) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                projectDetailsSliverAppBar(context,
                    bannerImageUrl: state.project.bannerImageUrl!),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQueryHelper.widthPercentage(12)),
                  sliver: SliverList.list(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Align(
                                alignment: Alignment.bottomCenter,
                                child: Icon(Icons.horizontal_rule_sharp),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                state.project.title!.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: AppTextStyles.phone_displayLarge,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQueryHelper.widthPercentage(12)),
                  sliver: SliverToBoxAdapter(
                    child: mediaQueryHelper.isSmallScreen
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              stillsSection(
                                  stills: state.project.stills!,
                                  aspectRatio: state.project.aspectRatio!),
                              detailsSection(project: state.project),
                            ],
                          )
                        : LayoutBuilder(
                            builder: (context, constraints) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: stillsSection(
                                        stills: state.project.stills!,
                                        aspectRatio:
                                            state.project.aspectRatio!),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: constraints.maxHeight,
                                      ),
                                      child: detailsSection(
                                          project: state.project),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ),
                // ============= FOOTER ===============
                footerSection(padding: mediaQueryHelper.widthPercentage(12)),
              ],
            );
          } else if (state is DetailsError) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: primaryColor.withOpacity(0.8),
        shape: const RoundedRectangleBorder(),
        child: const Icon(Icons.arrow_upward, color: Colors.white,),
      ),
    );
  }

  Widget stillsSection(
      {required List<String> stills, required double aspectRatio}) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ProjectStillItem(
          imgUrl: stills[index],
          aspectRatio: aspectRatio,
        ),
      ),
      itemCount: stills.length,
    );
  }

  Widget detailsSection({required ProjectDetails project}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        // ======= Details =======
        project.description == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title!.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    project.description!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayRegular,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
        project.production == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PRODUCTION',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    project.production!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayRegular,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
        project.directors == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DIRECTORS',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    project.directors!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayRegular,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
        project.producers == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PRODUCERS',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    project.producers!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayRegular,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
        project.cinematographers == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CINEMATOGRAPHER',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    project.cinematographers!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayRegular,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
        project.actors == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'STARRING',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    project.actors!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayRegular,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
        project.awards == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'AWARDS',
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    project.awards!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.phone_displayRegular,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
        const SizedBox(height: 40),
      ],
    );
  }
}
