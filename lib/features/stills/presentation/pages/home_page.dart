import 'package:ahmed_abdelrehim_portfolio/core/theme/colors.dart';
import 'package:ahmed_abdelrehim_portfolio/core/theme/text_styles.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/bloc/stills_bloc.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/pages/home_page_content.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/consts/routes.dart';
import '../../../../injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<StillsBloc>()..add(GetAllStillsEvent()),
      child: const HomePageContent(),
    );
  }
}
