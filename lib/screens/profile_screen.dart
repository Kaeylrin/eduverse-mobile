import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const ProfileScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final settingsOptions = [
      {'icon': Icons.notifications, 'label': 'Notifications'},
      {'icon': Icons.shield, 'label': 'Privacy & Security'},
      {'icon': Icons.settings, 'label': 'Account Settings'},
      {'icon': Icons.help_outline, 'label': 'Help & Support'},
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.gray50],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryLight]),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4))
                ],
              ),
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 4),
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0x40000000),
                                blurRadius: 16,
                                offset: Offset(0, 4))
                          ],
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1758521541622-d1e6be8c39bb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxoYXBweSUyMHN0dWRlbnQlMjBsZWFybmluZyUyMG9ubGluZXxlbnwxfHx8fDE3NzAyNzg5NDF8MA&ixlib=rb-4.1.0&q=80&w=1080'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 2))
                              ]),
                          child: const Icon(Icons.settings,
                              size: 20, color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Alex Johnson',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white)),
                  const SizedBox(height: 4),
                  Text('Student',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.white.withOpacity(0.8))),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.emoji_events,
                            size: 16, color: AppColors.white),
                        const SizedBox(width: 8),
                        Text('Member since January 2026',
                            style: TextStyle(
                                fontSize: 14, color: AppColors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 96),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Contact Information',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gray800)),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2))
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildContactItem(
                              Icons.mail,
                              'Email',
                              'alex.johnson@eduverse.com',
                              AppColors.accentBlue,
                              AppColors.primary),
                          const SizedBox(height: 16),
                          _buildContactItem(
                              Icons.phone,
                              'Phone',
                              '+1 (555) 123-4567',
                              AppColors.accentYellow,
                              AppColors.orange),
                          const SizedBox(height: 16),
                          _buildContactItem(
                              Icons.location_on,
                              'Location',
                              'New York, USA',
                              AppColors.accentLavender,
                              AppColors.purple),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text('Settings',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gray800)),
                    const SizedBox(height: 16),
                    Column(
                      children: settingsOptions.map((option) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.black.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2))
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Icon(option['icon'] as IconData,
                                          size: 24, color: AppColors.gray600),
                                      const SizedBox(width: 16),
                                      Expanded(
                                          child: Text(option['label'] as String,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.gray800))),
                                      const Icon(Icons.arrow_forward_ios,
                                          size: 16, color: AppColors.gray400),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),
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
                              side: const BorderSide(
                                  color: Colors.red, width: 2)),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout, size: 20),
                            SizedBox(width: 8),
                            Text('Log Out',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value,
      Color bgColor, Color iconColor) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, size: 20, color: iconColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style:
                      const TextStyle(fontSize: 14, color: AppColors.gray500)),
              const SizedBox(height: 4),
              Text(value,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray800)),
            ],
          ),
        ),
      ],
    );
  }
}
