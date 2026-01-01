part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  unauthenticated,
  authenticated,
  vaultCreated,
  pinSet,
  locked
}

class AuthState extends Equatable {
  final AuthStatus status;
  final bool isLoading;
  final String? error;
  final bool hasVault;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.isLoading = false,
    this.error,
    this.hasVault = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    bool? isLoading,
    String? error,
    bool? hasVault,
  }) {
    return AuthState(
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      hasVault: hasVault ?? this.hasVault,
    );
  }

  @override
  List<Object?> get props => [status, isLoading, error, hasVault];
}
