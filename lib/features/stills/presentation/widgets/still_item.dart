import 'package:ahmed_abdelrehim_portfolio/core/consts/routes.dart';
import 'package:ahmed_abdelrehim_portfolio/core/theme/colors.dart';
import 'package:ahmed_abdelrehim_portfolio/core/theme/text_styles.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_catalogue.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class StillItem extends StatefulWidget {
  final ProjectCatalogue project;

  const StillItem({super.key, required this.project});

  @override
  State<StillItem> createState() => _StillItemState();
}

class _StillItemState extends State<StillItem> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      onTap: () => context.go('$PORTFOLIO_PAGE/${widget.project.id}'),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // ==== Cover Image ====
          AspectRatio(
            aspectRatio: widget.project.aspectRatio!,
            child: CachedNetworkImage(
              imageUrl: widget.project.coverImageUrl!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const LinearProgressIndicator(color: primaryColor,),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey.shade300,
                child: const Icon(Icons.error),
              ),
            ),
          ),
          // ==== Project Title ====
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.project.title!,
                    style: AppTextStyles.phone_stills_title1,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.project.category!,
                    style: AppTextStyles.phone_stills_subtitle1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
