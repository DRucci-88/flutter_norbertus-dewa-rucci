import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc() : super(UserInitial()) {
//     on<UserEvent>((event, emit) {});
//   }
// }

class UserBloc extends Bloc<UserEvent, String> {
  UserBloc() : super("Unknown Name") {
    on<AddUser>((event, emit) {
      emit(event.username);
    });
  }
}
