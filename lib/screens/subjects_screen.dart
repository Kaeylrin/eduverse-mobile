import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      {
        'name': 'History',
        'modules': '12 Modules',
        'progress': 0.75,
        'color': AppColors.primary,
        'icon': Icons.public,
      },
      {
        'name': 'Science',
        'modules': '8 Modules',
        'progress': 0.45,
        'color': AppColors.cyan,
        'icon': Icons.science,
      },
      {
        'name': 'Mathematics',
        'modules': '15 Modules',
        'progress': 0.60,
        'color': AppColors.orange,
        'icon': Icons.calculate,
      },
      {
        'name': 'Literature',
        'modules': '10 Modules',
        'progress': 0.30,
        'color': AppColors.purple,
        'icon': Icons.menu_book,
      },
    ];

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
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Subjects',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${subjects.length} subjects available',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE3E8F7),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
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
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: subject['color'] as Color,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(
                                    subject['icon'] as IconData,
                                    size: 32,
                                    color: AppColors.white,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        subject['name'] as String,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.gray800,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        subject['modules'] as String,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.gray500,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: LinearProgressIndicator(
                                          value: subject['progress'] as double,
                                          backgroundColor: AppColors.gray200,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            subject['color'] as Color,
                                          ),
                                          minHeight: 6,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${((subject['progress'] as double) * 100).toInt()}% Complete',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.gray500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
