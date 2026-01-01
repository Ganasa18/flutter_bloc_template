import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_template/core/database/database_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final DatabaseHelper _databaseHelper;
  final FlutterSecureStorage _secureStorage;

  AuthBloc({
    required DatabaseHelper databaseHelper,
    required FlutterSecureStorage secureStorage,
  })  : _databaseHelper = databaseHelper,
        _secureStorage = secureStorage,
        super(const AuthState()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<CreateVault>(_onCreateVault);
    on<SetPin>(_onSetPin);
    on<VerifyPin>(_onVerifyPin);
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final vaultData = await _databaseHelper.getVaultMetadata();
      final hasVault = vaultData != null;
      // If we have a vault, we assume the user needs to login (or creating pin flow if interrupted?)
      // For now, simple logic: if vault exists -> unauthenticated (needs login). else -> no vault.

      emit(state.copyWith(
        status: hasVault ? AuthStatus.unauthenticated : AuthStatus.unknown,
        hasVault: hasVault,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _onCreateVault(
      CreateVault event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _databaseHelper.insertVaultMetadata(event.vaultName);
      emit(state.copyWith(
        status: AuthStatus.vaultCreated,
        hasVault: true,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _onSetPin(SetPin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _secureStorage.write(key: 'user_pin', value: event.pin);
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> _onVerifyPin(VerifyPin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final savedPin = await _secureStorage.read(key: 'user_pin');
      if (savedPin == event.pin) {
        emit(state.copyWith(
          status: AuthStatus.authenticated,
          isLoading: false,
        ));
      } else {
        emit(state.copyWith(
          error: "Incorrect PIN",
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }
}
