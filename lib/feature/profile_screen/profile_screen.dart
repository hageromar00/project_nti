import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_nti_app/core/color_manager/color_manager.dart';
import 'package:project_nti_app/feature/authentication/cubit/logic.dart';
import 'package:project_nti_app/feature/authentication/cubit/states.dart';
import 'package:project_nti_app/feature/authentication/login_screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final Color primaryBlue = const Color(0xFF0F6AD6);

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedOut) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
          );
        }

        if (state is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<UserCubit>();

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text('Profile'),
            centerTitle: false,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            padding:
            const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      backgroundImage: AssetImage('assets/user.png'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Zara Lindell',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '@zara',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Profile Items
                ProfileRow(
                  icon: Icons.female,
                  label: 'Gender',
                  trailingText: 'Male',
                  onTap: () {},
                  iconColor: ColorManager.darkGray,
                ),
                const Divider(),
                ProfileRow(
                  icon: Icons.cake_outlined,
                  label: 'Birthday',
                  trailingText: '12-12-2000',
                  onTap: () {},
                  iconColor: ColorManager.darkGray,
                ),
                const Divider(),
                ProfileRow(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  trailingText: 'Derlaxy@yahoo.com',
                  onTap: () {},
                  iconColor: ColorManager.darkGray,
                ),
                const Divider(),
                ProfileRow(
                  icon: Icons.phone_android_outlined,
                  label: 'Phone Number',
                  trailingText: '(307) 555-0133',
                  onTap: () {},
                  iconColor: ColorManager.darkGray,
                ),
                const Divider(),
                ProfileRow(
                  icon: Icons.lock_outline,
                  label: 'Change Password',
                  trailingText: '••••••••••',
                  onTap: () {},
                  iconColor: ColorManager.darkGray,
                ),
                const Divider(),
                const SizedBox(height: 30),

                state is UserLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.lightGray,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      cubit.signOut();
                    },
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String trailingText;
  final VoidCallback onTap;
  final Color iconColor;

  const ProfileRow({
    super.key,
    required this.icon,
    required this.label,
    required this.trailingText,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: iconColor.withOpacity(0.06),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              trailingText,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}