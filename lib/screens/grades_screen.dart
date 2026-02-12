import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subjects = [
      {'name': 'Science', 'grade': 92, 'color': AppColors.cyan, 'trend': '+5'},
      {
        'name': 'History',
        'grade': 88,
        'color': AppColors.purple,
        'trend': '+3'
      },
      {
        'name': 'Mathematics',
        'grade': 85,
        'color': AppColors.orange,
        'trend': '+7'
      },
      {
        'name': 'Literature',
        'grade': 95,
        'color': AppColors.pink,
        'trend': '+2'
      },
      {
        'name': 'Art & Design',
        'grade': 78,
        'color': AppColors.green,
        'trend': '+4'
      },
      {'name': 'Music', 'grade': 90, 'color': AppColors.red, 'trend': '+6'},
    ];

    final overallGrade =
        (subjects.fold(0, (sum, s) => sum + (s['grade'] as int)) /
                subjects.length)
            .round();

    final achievements = [
      {
        'title': 'Perfect Score',
        'description': 'Achieved 100% in a module',
        'icon': Icons.star,
        'color': AppColors.accentYellow,
        'iconColor': AppColors.orange
      },
      {
        'title': 'Quick Learner',
        'description': 'Completed 3 modules in a week',
        'icon': Icons.auto_awesome,
        'color': AppColors.accentLavender,
        'iconColor': AppColors.purple
      },
      {
        'title': '7 Day Streak',
        'description': 'Studied for 7 consecutive days',
        'icon': Icons.emoji_events,
        'color': AppColors.accentBlue,
        'iconColor': AppColors.primary
      },
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
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('My Progress',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white)),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Overall Grade',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.white.withOpacity(0.8))),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text('$overallGrade',
                                      style: const TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white)),
                                  Text('%',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: AppColors.white
                                              .withOpacity(0.8))),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.trending_up,
                                      size: 16, color: AppColors.green),
                                  const SizedBox(width: 8),
                                  Text("You're doing great!",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.white
                                              .withOpacity(0.9))),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: (_animationController.value * 0.2) - 0.1,
                              child: Transform.scale(
                                scale: 1.0 + (_animationController.value * 0.1),
                                child: Container(
                                  width: 96,
                                  height: 96,
                                  decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0x40000000),
                                            blurRadius: 16,
                                            offset: Offset(0, 4))
                                      ]),
                                  child: const Icon(Icons.emoji_events,
                                      size: 48, color: AppColors.primary),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildQuickStat('6', 'Subjects'),
                      const SizedBox(width: 12),
                      _buildQuickStat('12', 'Completed'),
                      const SizedBox(width: 12),
                      _buildQuickStat('A', 'Grade Level'),
                    ],
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
                    const Text('Subject Grades',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gray800)),
                    const SizedBox(height: 16),
                    Column(
                      children: subjects.asMap().entries.map((entry) {
                        final index = entry.key;
                        final subject = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 12,
                                          height: 12,
                                          decoration: BoxDecoration(
                                              color: subject['color'] as Color,
                                              shape: BoxShape.circle),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(subject['name'] as String,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.gray800)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.trending_up,
                                                size: 12,
                                                color: AppColors.green),
                                            const SizedBox(width: 4),
                                            Text(subject['trend'] as String,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.green)),
                                          ],
                                        ),
                                        const SizedBox(width: 8),
                                        Text('${subject['grade']}%',
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.gray800)),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: AppColors.gray100,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: FractionallySizedBox(
                                    alignment: Alignment.centerLeft,
                                    widthFactor:
                                        (subject['grade'] as int) / 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: subject['color'] as Color,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),
                    const Text('Recent Achievements',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gray800)),
                    const SizedBox(height: 16),
                    Column(
                      children: achievements.map((achievement) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: achievement['color'] as Color,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2))
                                    ],
                                  ),
                                  child: Icon(achievement['icon'] as IconData,
                                      size: 24,
                                      color: achievement['iconColor'] as Color),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(achievement['title'] as String,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.gray800)),
                                      const SizedBox(height: 4),
                                      Text(achievement['description'] as String,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.gray600)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
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

  Widget _buildQuickStat(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Text(value,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white)),
            Text(label,
                style: TextStyle(
                    fontSize: 12, color: AppColors.white.withOpacity(0.8))),
          ],
        ),
      ),
    );
  }
}
