import 'package:equatable/equatable.dart';
import '/data/models/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial state
class AuthInitial extends AuthState {}

// Loading state (during sign in/sign up)
class AuthLoading extends AuthState {}

// Success state (user logged in)
class AuthSuccess extends AuthState {
  final UserModel user;

  const AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

// Error state (validation or auth errors)
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

// Form validation error state
class AuthValidationError extends AuthState {
  final String? emailError;
  final String? passwordError;
  final String? nameError;

  const AuthValidationError({
    this.emailError,
    this.passwordError,
    this.nameError,
  });

  @override
  List<Object?> get props => [emailError, passwordError, nameError];
}