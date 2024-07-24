import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_catalogue.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_details.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/repository/stills_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';

class ProjectDetailsUseCase {
  final StillsRepository repo;

  ProjectDetailsUseCase({required this.repo});

  Future<Either<Failure, ProjectDetails>> call({required String id}) async {
    return await repo.getProjectDetails(id: id);
  }
}