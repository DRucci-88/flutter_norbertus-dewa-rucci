part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoaded extends HomeState {
  final String name;
  final String email;
  final String phoneNumber;
  const HomeLoaded({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [name, email, phoneNumber];
}
