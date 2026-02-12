import 'package:flutter/material.dart';

class BottomNavigationBar extends StatelessWidget {
  final String currentPage;
  final Function(String) onNavigate;
  final String userRole;

  const BottomNavigationBar({
    super.key,
    required this.currentPage,
    required this.onNavigate,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    if (userRole == 'student') {
      final List<Map<String, dynamic>> studentPages = [
        {'page': 'home', 'icon': Icons.home_rounded, 'label': 'Home'},
        {
          'page': 'subjects',
          'icon': Icons.menu_book_rounded,
          'label': 'Subjects'
        },
        {
          'page': 'modules',
          'icon': Icons.library_books_rounded,
          'label': 'Modules'
        },
        {
          'page': 'grades',
          'icon': Icons.emoji_events_rounded,
          'label': 'Grades'
        },
        {'page': 'profile', 'icon': Icons.person_rounded, 'label': 'Profile'},
      ];

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: studentPages.map((item) {
                final isActive = currentPage == item['page'];
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onNavigate(item['page']),
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 200),
                      tween: Tween(begin: 1.0, end: isActive ? 1.0 : 1.0),
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  item['icon'],
                                  color: isActive
                                      ? const Color(0xFF5B7FE3)
                                      : Colors.grey,
                                  size: 24,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['label'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isActive
                                        ? const Color(0xFF5B7FE3)
                                        : Colors.grey,
                                    fontWeight: isActive
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    } else {
      final List<Map<String, dynamic>> teacherPages = [
        {
          'page': 'teacher-dashboard',
          'icon': Icons.dashboard_rounded,
          'label': 'Dashboard'
        },
        {
          'page': 'teacher-modules',
          'icon': Icons.library_books_rounded,
          'label': 'Modules'
        },
        {'page': 'profile', 'icon': Icons.person_rounded, 'label': 'Profile'},
      ];

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: teacherPages.map((item) {
                final isActive = currentPage == item['page'];
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onNavigate(item['page']),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item['icon'],
                            color: isActive
                                ? const Color(0xFF5B7FE3)
                                : Colors.grey,
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['label'],
                            style: TextStyle(
                              fontSize: 12,
                              color: isActive
                                  ? const Color(0xFF5B7FE3)
                                  : Colors.grey,
                              fontWeight: isActive
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    }
  }
}
