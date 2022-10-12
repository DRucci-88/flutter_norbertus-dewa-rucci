part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class AddContact extends ContactEvent {
  final Contact newContact;
  const AddContact(this.newContact);
}

class DeleteContact extends ContactEvent {
  final int index;
  const DeleteContact(this.index);
}

class RefreshContact extends ContactEvent {
  const RefreshContact();
}
