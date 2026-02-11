import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const ProfileScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.accentLavender],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.accentYellow, AppColors.orange],
                      ),
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(
                        color: AppColors.white,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.2),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.gray800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Alex Johnson',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'alex.johnson@eduverse.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE3E8F7),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard('12', 'Completed'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard('3.7', 'GPA'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard('7', 'Streak'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
                children: [
                  const Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    'Edit Profile',
                    Icons.person_outline,
                    () {},
                  ),
                  _buildMenuItem(
                    'Notifications',
                    Icons.notifications_outlined,
                    () {},
                  ),
                  _buildMenuItem(
                    'Privacy & Security',
                    Icons.lock_outline,
                    () {},
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Preferences',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    'Language',
                    Icons.language,
                    () {},
                    trailing: 'English',
                  ),
                  _buildMenuItem(
                    'Dark Mode',
                    Icons.dark_mode_outlined,
                    () {},
                    trailing: 'Off',
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Support',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildMenuItem(
                    'Help Center',
                    Icons.help_outline,
                    () {},
                  ),
                  _buildMenuItem(
                    'About EduVerse',
                    Icons.info_outline,
                    () {},
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: onLogout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.red, width: 2),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFE3E8F7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    String title,
    IconData icon,
    VoidCallback onTap, {
    String? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: AppColors.gray600,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.gray800,
                      ),
                    ),
                  ),
                  if (trailing != null)
                    Text(
                      trailing,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.gray500,
                      ),
                    ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.gray400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
