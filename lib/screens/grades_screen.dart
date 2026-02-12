import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final grades = [
      {
        'subject': 'History',
        'module': 'Ancient Civilizations',
        'grade': 'A',
        'percentage': '92%',
        'color': AppColors.primary,
      },
      {
        'subject': 'Science',
        'module': 'Physics Fundamentals',
        'grade': 'B+',
        'percentage': '87%',
        'color': AppColors.cyan,
      },
      {
        'subject': 'Mathematics',
        'module': 'Algebra Basics',
        'grade': 'A-',
        'percentage': '90%',
        'color': AppColors.orange,
      },
      {
        'subject': 'Literature',
        'module': 'Shakespeare Studies',
        'grade': 'B',
        'percentage': '85%',
        'color': AppColors.purple,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Grades',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Track your academic performance',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE3E8F7),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child:
                            _buildSummaryCard('GPA', '3.7', Icons.emoji_events),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child:
                            _buildSummaryCard('Rank', '#12', Icons.trending_up),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child:
                            _buildSummaryCard('Average', '88%', Icons.timeline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
                itemCount: grades.length,
                itemBuilder: (context, index) {
                  final grade = grades[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      padding: const EdgeInsets.all(20),
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
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: (grade['color'] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: grade['color'] as Color,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                grade['grade'] as String,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: grade['color'] as Color,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  grade['subject'] as String,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.gray800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  grade['module'] as String,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.gray500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: (grade['color'] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              grade['percentage'] as String,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: grade['color'] as Color,
                              ),
                            ),
                          ),
                        ],
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

  Widget _buildSummaryCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: AppColors.white,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
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
}
