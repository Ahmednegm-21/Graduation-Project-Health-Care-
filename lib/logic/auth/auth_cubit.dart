import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/models/user_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // Email validation
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Password validation (minimum 6 characters)
  bool _isValidPassword(String password) {
    return password.length >= 6;
  }

  // Name validation
  bool _isValidName(String name) {
    return name.trim().isNotEmpty && name.length >= 2;
  }

  // Sign In method
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    // Validate inputs
    String? emailError;
    String? passwordError;

    if (email.isEmpty) {
      emailError = 'Email is required';
    } else if (!_isValidEmail(email)) {
      emailError = 'Invalid email format';
    }

    if (password.isEmpty) {
      passwordError = 'Password is required';
    } else if (!_isValidPassword(password)) {
      passwordError = 'Password must be at least 6 characters';
    }

    // If there are validation errors
    if (emailError != null || passwordError != null) {
      emit(AuthValidationError(
        emailError: emailError,
        passwordError: passwordError,
      ));
      return;
    }

    // Show loading
    emit(AuthLoading());

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Mock success - create fake user
    try {
      final user = UserModel(
        id: 'mock_id_${DateTime.now().millisecondsSinceEpoch}',
        name: 'User Name',
        email: email,
        createdAt: DateTime.now(),
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError('Sign in failed. Please try again.'));
    }
  }

  // Sign Up method
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    // Validate inputs
    String? nameError;
    String? emailError;
    String? passwordError;

    if (name.isEmpty) {
      nameError = 'Name is required';
    } else if (!_isValidName(name)) {
      nameError = 'Name must be at least 2 characters';
    }

    if (email.isEmpty) {
      emailError = 'Email is required';
    } else if (!_isValidEmail(email)) {
      emailError = 'Invalid email format';
    }

    if (password.isEmpty) {
      passwordError = 'Password is required';
    } else if (!_isValidPassword(password)) {
      passwordError = 'Password must be at least 6 characters';
    }

    // If there are validation errors
    if (nameError != null || emailError != null || passwordError != null) {
      emit(AuthValidationError(
        nameError: nameError,
        emailError: emailError,
        passwordError: passwordError,
      ));
      return;
    }

    // Show loading
    emit(AuthLoading());

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Mock success - create user
    try {
      final user = UserModel(
        id: 'mock_id_${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        email: email,
        createdAt: DateTime.now(),
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError('Sign up failed. Please try again.'));
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));
    
    final user = UserModel(
      id: 'google_id',
      name: 'Google User',
      email: 'user@google.com',
      createdAt: DateTime.now(),
    );
    
    emit(AuthSuccess(user));
  }

  // Sign in with Facebook
  Future<void> signInWithFacebook() async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));
    
    final user = UserModel(
      id: 'facebook_id',
      name: 'Facebook User',
      email: 'user@facebook.com',
      createdAt: DateTime.now(),
    );
    
    emit(AuthSuccess(user));
  }

  // Reset to initial state
  void reset() {
    emit(AuthInitial());
  }
}