import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_details.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/project_catalogue.dart';
import '../../domain/usecases/projects_catalogue_usecase.dart';
import '../../domain/usecases/project_details_usecase.dart';
import '../../domain/usecases/latest_projects_usecase.dart';

part 'stills_event.dart';

part 'stills_state.dart';

class StillsBloc extends Bloc<StillsEvent, StillsState> {
  final ProjectsCatalogueUseCase projectCatalogueUseCase;
  final LatestProjectsUseCase latestProjectsUseCase;

  StillsBloc({
    required this.projectCatalogueUseCase,
    required this.latestProjectsUseCase,
  }) : super(StillsInitial()) {
    on<StillsEvent>((event, emit) async {
      if (event is GetAllStillsEvent) {
        emit(StillsLoading());
        final response = await projectCatalogueUseCase();
        final leftOrRight = response.fold(
            (l) => StillsError(message: l.message),
            (r) => StillsSuccess(projects: r));
        emit(leftOrRight);
      }
      else if (event is GetLatestStillsEvent) {
        emit(StillsLoading());
        final response = await latestProjectsUseCase();
        final leftOrRight = response.fold(
            (l) => StillsError(message: l.message),
            (r) => StillsSuccess(projects: r));
        emit(leftOrRight);
      }
    });
  }
}
