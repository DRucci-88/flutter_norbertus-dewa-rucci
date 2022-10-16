part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends HomeEvent {}

class LogoutEvent extends HomeEvent {
  final Function nextRoute;
  const LogoutEvent({required this.nextRoute});
}
