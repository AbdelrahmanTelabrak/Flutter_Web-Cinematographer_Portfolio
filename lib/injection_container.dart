import 'package:ahmed_abdelrehim_portfolio/features/stills/data/data_source/remote/remote_stills_data_source.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/data/repository/stills_repository_impl.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/domain/usecases/project_details_usecase.dart';
import 'package:ahmed_abdelrehim_portfolio/features/stills/presentation/bloc/project_details_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/stills/domain/repository/stills_repository.dart';
import 'features/stills/domain/usecases/latest_projects_usecase.dart';
import 'features/stills/domain/usecases/projects_catalogue_usecase.dart';
import 'features/stills/presentation/bloc/stills_bloc.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  sl.registerLazySingleton<StillsRepository>(() => StillsRepositoryImpl(dataSource: sl()));

  sl.registerLazySingleton<StillsRemoteDataSource>(() => StillsRemoteDataSourceImpl());

  // ====== Use Cases ======
  sl.registerLazySingleton<ProjectsCatalogueUseCase>(() => ProjectsCatalogueUseCase(repo: sl()));

  sl.registerLazySingleton<LatestProjectsUseCase>(() => LatestProjectsUseCase(repo: sl()));

  sl.registerLazySingleton<ProjectDetailsUseCase>(() => ProjectDetailsUseCase(repo: sl()));

  // ====== BLOCs ======
  sl.registerFactory(() => StillsBloc(projectCatalogueUseCase: sl(), latestProjectsUseCase: sl()));

  sl.registerFactory<ProjectDetailsCubit>(() => ProjectDetailsCubit(projectDetailsUseCase: sl()));
}
