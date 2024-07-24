import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/pages/still_details_page_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/project_details_cubit.dart';

class StillDetailsPage extends StatelessWidget {
  final String id;
  const StillDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProjectDetailsCubit>()..getProjectDetails(id),
      child: const StillDetailsPageContent(),
    );
  }
}
