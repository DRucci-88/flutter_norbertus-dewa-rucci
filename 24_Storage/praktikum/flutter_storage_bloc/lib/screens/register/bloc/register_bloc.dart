import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_storage_bloc/data/shared_pref.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  SharedPref sharedPref;
  String name = '';
  String email = '';
  String phoneNumber = '';

  RegisterBloc(this.sharedPref) : super(RegisterInitial()) {
    // SharedPref a = SharedPref(sharedPref: SharedPreferences.getInstance());
    on<RegisterEvent>((event, emit) {});
    on<SaveRegisterEvent>((event, emit) {
      sharedPref.setName(event.name);
      sharedPref.setEmail(event.email);
      sharedPref.setPhoneNumber(event.phoneNumber);
      sharedPref.setIsLogin(true);

      event.nextRoute();
    });
  }
  checkLogin(Function nextRoute) async {
    bool isLogin = await sharedPref.getIsLoginKey() ?? false;

    if (isLogin) {
      nextRoute();
    }
  }
}
