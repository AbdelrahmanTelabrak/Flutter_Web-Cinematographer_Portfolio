part of 'stills_bloc.dart';

@immutable
sealed class StillsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllStillsEvent extends StillsEvent {}
class GetLatestStillsEvent extends StillsEvent {}
class RefreshStillsEvent extends StillsEvent {}
