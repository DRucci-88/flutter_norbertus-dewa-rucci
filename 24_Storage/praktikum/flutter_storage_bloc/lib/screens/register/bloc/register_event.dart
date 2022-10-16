part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SaveRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final Function nextRoute;

  const SaveRegisterEvent({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.nextRoute,
  });

  @override
  List<Object> get props => [name, email, phoneNumber];
}
