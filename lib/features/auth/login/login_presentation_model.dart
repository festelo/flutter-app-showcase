import 'package:dartz/dartz.dart';
import 'package:flutter_demo/core/domain/model/user.dart';
import 'package:flutter_demo/core/utils/bloc_extensions.dart';
import 'package:flutter_demo/features/auth/domain/model/log_in_failure.dart';
import 'package:flutter_demo/features/auth/login/login_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    LoginInitialParams initialParams,
  )   : username = '',
        password = '',
        logInResult = const FutureResult.empty();

  /// Used for the copyWith method
  LoginPresentationModel._({
    required this.username,
    required this.password,
    required this.logInResult,
  });

  final String username;

  final String password;

  final FutureResult<Either<LogInFailure, User>> logInResult;

  @override
  bool get isLoading => logInResult.isPending();

  @override
  bool get isLoginEnabled => username.isNotEmpty && password.isNotEmpty;

  LoginPresentationModel copyWith({
    String? username,
    String? password,
    FutureResult<Either<LogInFailure, User>>? logInResult,
  }) {
    return LoginPresentationModel._(
      username: username ?? this.username,
      password: password ?? this.password,
      logInResult: logInResult ?? this.logInResult,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get isLoading;
  bool get isLoginEnabled;
}
