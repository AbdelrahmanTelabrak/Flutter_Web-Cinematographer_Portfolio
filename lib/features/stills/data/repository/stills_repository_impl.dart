import 'package:ahmed_abdelrehim_portfolio/core/errors.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/data/data_source/remote/remote_stills_data_source.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_catalogue.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/entity/project_details.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/repository/stills_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class StillsRepositoryImpl implements StillsRepository {
  final StillsRemoteDataSource dataSource;

  StillsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<ProjectCatalogue>>> getLatestProjects() async {
    try {
      final projects = await dataSource.getLatestProjects();
      print('IN REPOSITORY: SUCCESS');
      return Right(projects);
    } on FirebaseException {
      print('IN REPOSITORY: FAILED');
      return Left(ServerFailure(message: 'Firebase Failure'));
    }
  }

  @override
  Future<Either<Failure, ProjectDetails>> getProjectDetails(
      {required String id}) async {
    try {
      final project = await dataSource.getProjectDetails(id: id);
      return Right(project);
    } on ServerException {
      return Left(ServerFailure(message: ''));
    }
  }

  @override
  Future<Either<Failure, List<ProjectCatalogue>>> getProjectsCatalogue() async {
    try {
      final projects = await dataSource.getProjectsCatalogue();
      // print('IN REPOSITORY: SUCCESS');
      // for (var project in projects) {
      //   print(project.toString());
      // }
      final List<ProjectCatalogue> projectsList = projects
          .map((project) => ProjectCatalogue(
                id: project.id,
                title: project.title,
                category: project.category,
                coverImageUrl: project.coverImageUrl,
                aspectRatio: project.aspectRatio,
              ))
          .toList();
      return Right(projectsList);
    } on FirebaseException catch (e) {
      print('IN REPOSITORY: FAILED');
      return Left(ServerFailure(message: 'Firebase Failure:\n$e'));
    }
  }
}
