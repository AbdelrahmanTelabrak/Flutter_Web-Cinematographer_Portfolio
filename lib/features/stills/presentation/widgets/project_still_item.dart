import 'package:ahmed_abdelrehim_portfolio/core/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProjectStillItem extends StatefulWidget {
  final String imgUrl;
  final double aspectRatio;
  const ProjectStillItem({super.key, required this.imgUrl, required this.aspectRatio});

  @override
  State<ProjectStillItem> createState() => _ProjectStillItemState();
}

class _ProjectStillItemState extends State<ProjectStillItem> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: CachedNetworkImage(
        imageUrl: widget.imgUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const LinearProgressIndicator(color: primaryColor),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey.shade300,
          child: const Icon(Icons.error),
        ),
      ),
    );
  }
}
