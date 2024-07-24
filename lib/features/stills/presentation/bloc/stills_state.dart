part of 'stills_bloc.dart';

@immutable
sealed class StillsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class StillsInitial extends StillsState {}
final class StillsLoading extends StillsState {}

final class StillsSuccess extends StillsState {
  final List<ProjectCatalogue> projects;
  StillsSuccess({required this.projects});
}

final class StillsError extends StillsState {
  final String message;
  StillsError({required this.message});
}