import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_storage_bloc/data/shared_pref.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  SharedPref sharedPref;
  String name = '';
  String email = '';
  String phoneNumber = '';

  HomeBloc(this.sharedPref) : super(const HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<InitialEvent>((event, emit) async {
      name = await sharedPref.getName() ?? '';
      email = await sharedPref.geEmail() ?? '';
      phoneNumber = await sharedPref.getPhoneNumber() ?? '';

      emit(HomeLoaded(name: name, email: email, phoneNumber: phoneNumber));
    });
    on<LogoutEvent>((event, emit) async {
      await sharedPref.clearAllData();
      event.nextRoute();
    });
  }
}
