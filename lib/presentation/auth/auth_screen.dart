import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_template/bloc/auth/auth_bloc.dart';
import 'package:my_template/routing/route.gr.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We can inject the Bloc here or higher up. Assuming for now we provide it here or globally.
    // If we want to check status on load:
    /*
    context.read<AuthBloc>().add(CheckAuthStatus());
    */

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // background-dark
      body: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: CustomPaint(
                painter: DotPatternPainter(),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  // Logo & Branding
                  _buildLogoSection(),

                  const SizedBox(height: 48),

                  // Action Buttons
                  _buildActionButtons(context),

                  const Spacer(),

                  // Footer
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        // Icon Container with glow
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: const Color(0xFF5e5ef7).withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF5e5ef7).withValues(alpha: 0.5),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ]),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E), // surface-dark
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF333333)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    )
                  ]),
              child: const Icon(
                Icons.lock_outline,
                size: 48,
                color: Color(0xFF5e5ef7), // primary
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          "SecureVault",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE2E2E2), // text-main
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Private. Offline. Yours.",
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFA0A0A0), // text-muted
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        // Primary Button: Create Vault
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              context.router.push(const CreateVaultRoute());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5e5ef7), // primary
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
              shadowColor: const Color(0xFF5e5ef7).withValues(alpha: 0.4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_circle_outline, size: 24),
                SizedBox(width: 12),
                Text(
                  "Create Vault",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Secondary Button: Restore Backup
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              // TODO: Implement restore backup
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Restore Backup not implemented yet")),
              );
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFF1E1E1E), // surface-dark
              foregroundColor: const Color(0xFFE2E2E2),
              side: const BorderSide(color: Color(0xFF333333)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_download_outlined,
                    size: 24, color: Color(0xFFA0A0A0)),
                SizedBox(width: 12),
                Text(
                  "Restore Backup",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Container(
          height: 1,
          width: 64,
          color: const Color(0xFF333333),
        ),
        const SizedBox(height: 12),
        const Text(
          "No internet connection required.\nYour secrets stay locally on this device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFA0A0A0), // text-muted
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1E1E1E)
      ..strokeWidth = 1;

    for (double x = 0; x < size.width; x += 24) {
      for (double y = 0; y < size.height; y += 24) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
