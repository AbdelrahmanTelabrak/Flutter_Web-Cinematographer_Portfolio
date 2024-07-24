part of 'project_details_cubit.dart';

@immutable
sealed class ProjectDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProjectDetailsInitial extends ProjectDetailsState {}
final class DetailsLoading extends ProjectDetailsState {}
final class DetailsSuccess extends ProjectDetailsState {
  final ProjectDetails project;
  DetailsSuccess({required this.project});
}
final class DetailsError extends ProjectDetailsState {
  final String message;
  DetailsError({required this.message});
}
