import 'package:flutter_mvvm_riverpod_task/main.dart';
import 'package:flutter_mvvm_riverpod_task/utils/routes/app_routes.dart';
import 'package:flutter_mvvm_riverpod_task/view_model/user_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer';

import '../model/user_model.dart';
import '../repository/auth_repository.dart';
import '../utils/utils.dart';


// Define the state class
class AuthState {
  final bool loading;
  final bool signUpLoading;

  const AuthState({this.loading = false, this.signUpLoading = false});

  AuthState copyWith({bool? loading, bool? signUpLoading}) {
    return AuthState(
      loading: loading ?? this.loading,
      signUpLoading: signUpLoading ?? this.signUpLoading,
    );
  }
}

// StateNotifier to manage AuthState
class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final UserViewModel _userViewModel;

  AuthController(this._authRepository, this._userViewModel)
      : super(const AuthState());

  // Login API
  Future<void> loginApi(dynamic data, BuildContext context) async {
    state = state.copyWith(loading: true);

    try {
      final value = await _authRepository.signIn(data);
      log(value.toString());
      state = state.copyWith(loading: false);

      // Save user token
      // _userViewModel.saveUser(UserModel(token: value["token"].toString()));

      Utils.flushBarErrorMessage("Login successfully", context);
      // Navigator.pushNamed(context, RouteNames.home);
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
      state = state.copyWith(loading: false);
    }
  }

  // Sign Up API
  Future<void> signUpApi(dynamic data, BuildContext context) async {
    state = state.copyWith(signUpLoading: true);

    try {
      final value = await _authRepository.signUp(data);
      log(value.toString());
      state = state.copyWith(signUpLoading: false);



      Utils.flushBarErrorMessage("Create account successfully", context);
     context.goNamed(AppRoutesConstant.dashBoardRouteName);
    } catch (error) {
      Utils.flushBarErrorMessage(error.toString(), context);
      state = state.copyWith(signUpLoading: false);
    }
  }
}

// Create the StateNotifierProvider for AuthController
final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
      (ref) {
    final authRepository = ref.read(authRepositoryProvider);
    final userViewModel = ref.read(userViewModelProvider);
    return AuthController(authRepository, userViewModel);
  },
);

// AuthRepository provider
final authRepositoryProvider = Provider((ref) => AuthRepository());

// UserViewModel provider
final userViewModelProvider = Provider((ref) => UserViewModel());
