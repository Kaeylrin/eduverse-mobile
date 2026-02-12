import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  final Function(String) onNavigate;

  const HomeDashboard({super.key, required this.onNavigate});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..forward();
    _pulseController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    _headerController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stats = [
      {
        'label': 'Modules Completed',
        'value': '12',
        'icon': Icons.track_changes,
        'color': const Color(0xFFE3F2FD),
        'iconColor': const Color(0xFF5B7FE3)
      },
      {
        'label': 'Current Progress',
        'value': '68%',
        'icon': Icons.emoji_events,
        'color': const Color(0xFFFFF5CC),
        'iconColor': const Color(0xFFF59E0B)
      },
      {
        'label': 'Study Streak',
        'value': '7 days',
        'icon': Icons.rocket_launch,
        'color': const Color(0xFFF3F0FF),
        'iconColor': const Color(0xFF8B5CF6)
      },
    ];

    final features = [
      {
        'title': 'My Subjects',
        'icon': Icons.menu_book_rounded,
        'color': const Color(0xFF5B7FE3),
        'description': 'Browse your courses',
        'page': 'subjects'
      },
      {
        'title': 'My Modules',
        'icon': Icons.description,
        'color': const Color(0xFF8B5CF6),
        'description': 'Continue learning',
        'page': 'modules'
      },
      {
        'title': 'Virtual Worlds',
        'icon': Icons.language,
        'color': const Color(0xFF06B6D4),
        'description': 'Explore VR environments',
        'page': 'vr-entry'
      },
      {
        'title': 'My Grades',
        'icon': Icons.emoji_events,
        'color': const Color(0xFFF59E0B),
        'description': 'Track your progress',
        'page': 'grades'
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFF3F0FF), Color(0xFFE3F2FD)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0, -0.5), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: _headerController, curve: Curves.easeOut)),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF5B7FE3),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF5B7FE3).withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10))
                    ],
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedBuilder(
                                  animation: _pulseController,
                                  builder: (context, child) {
                                    return Transform.scale(
                                      scale:
                                          1.0 + 0.02 * _pulseController.value,
                                      child: const Text('Hello, Alex! 👋',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    );
                                  },
                                ),
                                const SizedBox(height: 4),
                                Text('Ready to learn something new?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.8))),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => widget.onNavigate('profile'),
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFFFF5CC),
                                        Color(0xFFF59E0B)
                                      ]),
                                      shape: BoxShape.circle),
                                  child: const Center(
                                      child: Text('A',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1F2937)))),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: stats.map((stat) {
                          final index = stats.indexOf(stat);
                          return Expanded(
                            child: TweenAnimationBuilder<double>(
                              duration:
                                  Duration(milliseconds: 600 + index * 100),
                              tween: Tween(begin: 0.0, end: 1.0),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: Opacity(
                                    opacity: value,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: index > 0 ? 6 : 0,
                                          right:
                                              index < stats.length - 1 ? 6 : 0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 10)
                                          ]),
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: stat['color'] as Color,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Icon(
                                                stat['icon'] as IconData,
                                                size: 20,
                                                color:
                                                    stat['iconColor'] as Color),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(stat['value'] as String,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF1F2937))),
                                          const SizedBox(height: 2),
                                          Text(stat['label'] as String,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xFF6B7280)),
                                              textAlign: TextAlign.center,
                                              maxLines: 2),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Quick Access',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937))),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.1,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16),
                        itemCount: features.length,
                        itemBuilder: (context, index) {
                          final feature = features[index];
                          return TweenAnimationBuilder<double>(
                            duration: Duration(milliseconds: 800 + index * 100),
                            tween: Tween(begin: 0.0, end: 1.0),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: 0.9 + 0.1 * value,
                                child: Opacity(
                                  opacity: value,
                                  child: GestureDetector(
                                    onTap: () => widget
                                        .onNavigate(feature['page'] as String),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 15,
                                                offset: const Offset(0, 5))
                                          ]),
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 56,
                                            height: 56,
                                            decoration: BoxDecoration(
                                                color:
                                                    feature['color'] as Color,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      blurRadius: 8)
                                                ]),
                                            child: Icon(
                                                feature['icon'] as IconData,
                                                size: 28,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(feature['title'] as String,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF1F2937))),
                                          const SizedBox(height: 4),
                                          Text(feature['description'] as String,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF6B7280))),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      const Text('Continue Learning',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F2937))),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFF5B7FE3), Color(0xFF8B9FFF)]),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 20,
                                offset: const Offset(0, 10))
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 128,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(24)),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1764706166195-cccf1238d510'),
                                    fit: BoxFit.cover),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(24)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      const Color(0xFF5B7FE3).withOpacity(0.8)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Current Module',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white
                                                        .withOpacity(0.8))),
                                            const SizedBox(height: 4),
                                            const Text('Ancient Civilizations',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            const SizedBox(height: 4),
                                            Text('History • Chapter 3',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white
                                                        .withOpacity(0.9))),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 64,
                                        height: 64,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: const Icon(
                                            Icons.menu_book_rounded,
                                            size: 32,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Progress',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white
                                                  .withOpacity(0.9))),
                                      Text('75%',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white
                                                  .withOpacity(0.9))),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: TweenAnimationBuilder<double>(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      tween: Tween(begin: 0.0, end: 0.75),
                                      builder: (context, value, child) {
                                        return LinearProgressIndicator(
                                          value: value,
                                          backgroundColor:
                                              Colors.white.withOpacity(0.2),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(Colors.white),
                                          minHeight: 8,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor:
                                            const Color(0xFF5B7FE3),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        elevation: 0,
                                      ),
                                      child: const Text('Continue Learning',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100), // Extra space for bottom nav
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentPage: 'home',
        onNavigate: widget.onNavigate,
        userRole: 'student',
      ),
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
