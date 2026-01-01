import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template/bloc/auth/auth_bloc.dart';
import 'package:my_template/routing/route.gr.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

@RoutePage()
class AuthCreatePinScreen extends StatefulWidget {
  const AuthCreatePinScreen({super.key});

  @override
  State<AuthCreatePinScreen> createState() => _AuthCreatePinScreenState();
}

class _AuthCreatePinScreenState extends State<AuthCreatePinScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          // Go to Home (using replaceAll to clear stack)
          context.router.replaceAll([const HomeRoute()]);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFE2E2E2)),
            onPressed: () => context.router.back(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create a PIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE2E2E2),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Secure your vault with a 6-digit PIN.",
                style: TextStyle(
                  color: Color(0xFFA0A0A0),
                ),
              ),
              const SizedBox(height: 48),
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: const Color(0xFF1E1E1E),
                  inactiveFillColor: const Color(0xFF121212),
                  selectedFillColor: const Color(0xFF1E1E1E),
                  activeColor: const Color(0xFF5e5ef7),
                  inactiveColor: const Color(0xFF333333),
                  selectedColor: const Color(0xFF5e5ef7),
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _pinController,
                textStyle: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  // Auto submit or wait for button
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (_pinController.text.length == 6) {
                      context.read<AuthBloc>().add(SetPin(_pinController.text));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5e5ef7),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text("Set PIN", style: TextStyle(fontSize: 17)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
