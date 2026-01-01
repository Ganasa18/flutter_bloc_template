import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template/bloc/auth/auth_bloc.dart';
import 'package:my_template/routing/route.gr.dart';

@RoutePage()
class CreateVaultScreen extends StatefulWidget {
  const CreateVaultScreen({super.key});

  @override
  State<CreateVaultScreen> createState() => _CreateVaultScreenState();
}

class _CreateVaultScreenState extends State<CreateVaultScreen> {
  final TextEditingController _vaultNameController = TextEditingController();

  @override
  void dispose() {
    _vaultNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.hasVault && state.status == AuthStatus.vaultCreated) {
          // Navigate to PIN creation
          context.router.push(const AuthCreatePinRoute());
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name your Vault",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE2E2E2),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Give your safe space a name.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFA0A0A0),
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _vaultNameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Vault Name",
                  labelStyle: const TextStyle(color: Color(0xFFA0A0A0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF333333)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF5e5ef7)),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF1E1E1E),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (_vaultNameController.text.isNotEmpty) {
                      context
                          .read<AuthBloc>()
                          .add(CreateVault(_vaultNameController.text));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5e5ef7),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text("Continue", style: TextStyle(fontSize: 17)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
