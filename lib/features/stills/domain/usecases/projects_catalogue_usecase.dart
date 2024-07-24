import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_catalogue.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/repository/stills_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';

class ProjectsCatalogueUseCase {
  final StillsRepository repo;

  ProjectsCatalogueUseCase({required this.repo});

  Future<Either<Failure, List<ProjectCatalogue>>> call() async {
    return await repo.getProjectsCatalogue();
  }
}