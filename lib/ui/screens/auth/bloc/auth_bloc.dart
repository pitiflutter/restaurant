 import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:restaurant/common/exeptions.dart';
import 'package:restaurant/data/repo/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      try {
        if (event is AuthLoginButtonClicked) {
          emit(AuthLoading());
          await authRepository.login(event.email, event.pass);
          emit(AuthSuccess());
        } else if (event is AuthRegisterButtonClicked) {
          emit(AuthLoading());
          await authRepository.register(
              event.name, event.lastName, event.email, event.pass, event.phone);
          emit(AuthSuccess());
        }
      } catch (e) {
        emit(AuthError(AppExeptions()));
      }
    });
  }
}
