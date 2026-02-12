import 'package:flutter/material.dart';

class SubjectsScreen extends StatefulWidget {
  final Function(String, [dynamic]) onNavigate;
  const SubjectsScreen({super.key, required this.onNavigate});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final subjects = [
    {
      'name': 'Science',
      'icon': Icons.science,
      'color': const Color(0xFF06B6D4),
      'modules': 8,
      'progress': 65,
      'bgColor': const Color(0xFFE3F2FD)
    },
    {
      'name': 'History',
      'icon': Icons.language,
      'color': const Color(0xFF8B5CF6),
      'modules': 12,
      'progress': 75,
      'bgColor': const Color(0xFFF3F0FF)
    },
    {
      'name': 'Mathematics',
      'icon': Icons.calculate,
      'color': const Color(0xFFF59E0B),
      'modules': 10,
      'progress': 45,
      'bgColor': const Color(0xFFFFF5CC)
    },
    {
      'name': 'Literature',
      'icon': Icons.menu_book,
      'color': const Color(0xFFEC4899),
      'modules': 15,
      'progress': 80,
      'bgColor': const Color(0xFFFCE7F3)
    },
    {
      'name': 'Art & Design',
      'icon': Icons.palette,
      'color': const Color(0xFF10B981),
      'modules': 6,
      'progress': 30,
      'bgColor': const Color(0xFFD1FAE5)
    },
    {
      'name': 'Music',
      'icon': Icons.music_note,
      'color': const Color(0xFFEF4444),
      'modules': 9,
      'progress': 55,
      'bgColor': const Color(0xFFFEE2E2)
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('My Subjects',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937))),
                  SizedBox(height: 4),
                  Text('Choose a subject to explore',
                      style: TextStyle(fontSize: 16, color: Color(0xFF6B7280))),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFF5B7FE3), Color(0xFF8B9FFF)]),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 20)
                        ],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const Text('Overall Progress',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(children: const [
                                Text('6',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 4),
                                Text('Active Subjects',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70))
                              ]),
                              Column(children: const [
                                Text('60',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 4),
                                Text('Total Modules',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70))
                              ]),
                              Column(children: const [
                                Text('58%',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(height: 4),
                                Text('Avg Progress',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70))
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ...subjects.map((subject) {
                      final index = subjects.indexOf(subject);
                      return TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 600 + index * 100),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(-20 * (1 - value), 0),
                            child: Opacity(
                              opacity: value,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 15)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () => widget.onNavigate(
                                        'subject-details', subject),
                                    borderRadius: BorderRadius.circular(20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 64,
                                            height: 64,
                                            decoration: BoxDecoration(
                                                color:
                                                    subject['bgColor'] as Color,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Icon(
                                                subject['icon'] as IconData,
                                                size: 32,
                                                color:
                                                    subject['color'] as Color),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(subject['name'] as String,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF1F2937))),
                                                const SizedBox(height: 4),
                                                Text(
                                                    '${subject['modules']} modules • ${subject['progress']}% complete',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xFF6B7280))),
                                                const SizedBox(height: 8),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: (subject['progress']
                                                            as int) /
                                                        100,
                                                    backgroundColor:
                                                        const Color(0xFFE5E7EB),
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            subject['color']
                                                                as Color),
                                                    minHeight: 6,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          const Icon(Icons.arrow_forward_ios,
                                              size: 20,
                                              color: Color(0xFF9CA3AF)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentPage: 'subjects',
          onNavigate: widget.onNavigate,
          userRole: 'student'),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  final String currentPage;
  final Function(String) onNavigate;
  final String userRole;
  const BottomNavigationBar(
      {super.key,
      required this.currentPage,
      required this.onNavigate,
      required this.userRole});

  @override
  Widget build(BuildContext context) {
    final pages = [
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
      {'page': 'grades', 'icon': Icons.emoji_events_rounded, 'label': 'Grades'},
      {'page': 'profile', 'icon': Icons.person_rounded, 'label': 'Profile'},
    ];

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: pages.map((item) {
              final isActive = currentPage == item['page'];
              return Expanded(
                child: GestureDetector(
                  onTap: () => onNavigate(item['page'] as String),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(item['icon'] as IconData,
                            color: isActive
                                ? const Color(0xFF5B7FE3)
                                : Colors.grey,
                            size: 24),
                        const SizedBox(height: 4),
                        Text(item['label'] as String,
                            style: TextStyle(
                                fontSize: 12,
                                color: isActive
                                    ? const Color(0xFF5B7FE3)
                                    : Colors.grey,
                                fontWeight: isActive
                                    ? FontWeight.w600
                                    : FontWeight.normal)),
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
