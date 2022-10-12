import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_1/model/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc()
      : super(const ContactInitial([
          // Contact("1", 'Norbertus', "1234"),
          // Contact("2", 'Dewa', "4321"),
          // Contact("3", 'Rucci', "9876"),
          // Contact("4", 'asw', "0000"),
        ])) {
    on<AddContact>((event, emit) async {
      emit(ContactLoading(state.contacts));
      try {
        await Future.delayed(const Duration(seconds: 2));
        return emit(ContactLoaded([...state.contacts, event.newContact]));
      } catch (e) {
        emit(ContactFailed(state.contacts));
      }
    });
    on<DeleteContact>((event, emit) {
      final contacts = state.contacts;
      print(event.index);
      contacts.removeAt(event.index);
      contacts.forEach((element) => print(element.name));

      if (contacts.isEmpty) {
        print('Contacts Kosong');
        return emit(ContactInitial(contacts));
      }
      return emit(ContactLoaded(contacts));
    });

    on<RefreshContact>((event, emit) {
      emit(ContactLoaded(state.contacts));
    });
  }
}
