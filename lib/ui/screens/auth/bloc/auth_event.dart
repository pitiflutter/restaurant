part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthLoginButtonClicked extends AuthEvent {
  final String email;
  final String pass;
  

  AuthLoginButtonClicked(
      this.email, this.pass,  );
}

class AuthRegisterButtonClicked extends AuthEvent {
   final String email;
  final String pass;
  final String name;
  final String phone;
  final String lastName;

  AuthRegisterButtonClicked(this.email, this.pass, this.name, this.phone, this.lastName);

 }
