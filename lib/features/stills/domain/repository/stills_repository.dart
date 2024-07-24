import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_catalogue.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_details.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors.dart';

abstract class StillsRepository {
  Future<Either<Failure, List<ProjectCatalogue>>> getProjectsCatalogue();
  Future<Either<Failure, List<ProjectCatalogue>>> getLatestProjects();
  Future<Either<Failure, ProjectDetails>> getProjectDetails({required String id});
}