part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckAuthStatus extends AuthEvent {}

class CreateVault extends AuthEvent {
  final String vaultName;
  const CreateVault(this.vaultName);
}

class SetPin extends AuthEvent {
  final String pin;
  const SetPin(this.pin);
}

class VerifyPin extends AuthEvent {
  final String pin;
  const VerifyPin(this.pin);
}

class ResetVault extends AuthEvent {}
