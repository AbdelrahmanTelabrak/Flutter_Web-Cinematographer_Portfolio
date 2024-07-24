import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/project_details.dart';
import '../../domain/usecases/project_details_usecase.dart';

part 'project_details_state.dart';

class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  final ProjectDetailsUseCase projectDetailsUseCase;
  ProjectDetailsCubit({required this.projectDetailsUseCase}) : super(ProjectDetailsInitial());

  Future<void> getProjectDetails(String id) async {
    emit(DetailsLoading());
    final result = await projectDetailsUseCase(id: id);
    result.fold(
      (l) => emit(DetailsError(message: '')),
      (r) => emit(DetailsSuccess(project: r)),
    );
  }
}
