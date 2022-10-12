part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUser extends UserEvent {
  final String username;
  const AddUser(this.username);
}
