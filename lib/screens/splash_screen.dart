import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const SplashScreen({super.key, required this.onComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _floatingController1;
  late AnimationController _floatingController2;
  late AnimationController _floatingController3;
  late AnimationController _dotsController;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();

    _floatingController1 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();

    _floatingController2 = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    )..repeat();

    _floatingController3 = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat();

    _dotsController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    Timer(const Duration(seconds: 3), widget.onComplete);
  }

  @override
  void dispose() {
    _logoController.dispose();
    _floatingController1.dispose();
    _floatingController2.dispose();
    _floatingController3.dispose();
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryLight],
        ),
      ),
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _floatingController1,
            builder: (context, child) {
              final animation = Tween<double>(begin: 0, end: -20).animate(
                CurvedAnimation(
                  parent: _floatingController1,
                  curve: Curves.easeInOut,
                ),
              );
              return Positioned(
                top: 80,
                left: 40,
                child: Transform.translate(
                  offset: Offset(0, animation.value),
                  child: Transform.rotate(
                    angle: (_floatingController1.value * 0.1),
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _floatingController2,
            builder: (context, child) {
              final animation = Tween<double>(begin: 0, end: 20).animate(
                CurvedAnimation(
                  parent: _floatingController2,
                  curve: Curves.easeInOut,
                ),
              );
              return Positioned(
                bottom: 128,
                right: 48,
                child: Transform.translate(
                  offset: Offset(0, animation.value),
                  child: Transform.rotate(
                    angle: -(_floatingController2.value * 0.1),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _floatingController3,
            builder: (context, child) {
              final animation = Tween<double>(begin: 0, end: -15).animate(
                CurvedAnimation(
                  parent: _floatingController3,
                  curve: Curves.easeInOut,
                ),
              );
              final scaleAnimation =
                  Tween<double>(begin: 1.0, end: 1.1).animate(
                CurvedAnimation(
                  parent: _floatingController3,
                  curve: Curves.easeInOut,
                ),
              );
              return Positioned(
                top: MediaQuery.of(context).size.height / 3,
                right: 32,
                child: Transform.translate(
                  offset: Offset(0, animation.value),
                  child: Transform.scale(
                    scale: scaleAnimation.value,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _logoController,
                    curve: Curves.elasticOut,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          size: 56,
                          color: AppColors.primary,
                        ),
                      ),
                      Positioned(
                        top: -8,
                        right: -8,
                        child: AnimatedBuilder(
                          animation: _floatingController1,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _floatingController1.value * 0.2,
                              child: Transform.scale(
                                scale: 1.0 + (_floatingController1.value * 0.1),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: AppColors.accentYellow,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.auto_awesome,
                                    size: 20,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: -8,
                        left: -8,
                        child: AnimatedBuilder(
                          animation: _floatingController2,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: -(_floatingController2.value * 0.2),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: AppColors.secondary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.public,
                                  size: 20,
                                  color: AppColors.primary,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                FadeTransition(
                  opacity: _logoController,
                  child: const Text(
                    'EduVerse',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                FadeTransition(
                  opacity: _logoController,
                  child: Text(
                    'Learn Beyond the Classroom',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedBuilder(
                      animation: _dotsController,
                      builder: (context, child) {
                        final delay = index * 0.2;
                        final animation =
                            Tween<double>(begin: 1.0, end: 1.5).animate(
                          CurvedAnimation(
                            parent: _dotsController,
                            curve: Interval(
                              delay,
                              delay + 0.5,
                              curve: Curves.easeInOut,
                            ),
                          ),
                        );
                        final opacityAnimation =
                            Tween<double>(begin: 0.5, end: 1.0).animate(
                          CurvedAnimation(
                            parent: _dotsController,
                            curve: Interval(
                              delay,
                              delay + 0.5,
                              curve: Curves.easeInOut,
                            ),
                          ),
                        );
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.white
                                .withOpacity(opacityAnimation.value),
                            shape: BoxShape.circle,
                          ),
                          transform: Matrix4.identity()..scale(animation.value),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
