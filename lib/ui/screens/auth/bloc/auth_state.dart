part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
    @override
  List<Object> get props => [ ];
}

class AuthInitial extends AuthState {
 }

class AuthError extends AuthState {
  final AppExeptions appExeption;

  AuthError(this.appExeption);
 }

class AuthLoading extends AuthState {
 }

class AuthSuccess extends AuthState {
 }
