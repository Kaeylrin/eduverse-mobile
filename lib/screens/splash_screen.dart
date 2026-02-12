import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const SplashScreen({super.key, required this.onComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _dotsController;
  late AnimationController _float1Controller;
  late AnimationController _float2Controller;
  late AnimationController _float3Controller;
  late AnimationController _sparkleController;
  late AnimationController _globeController;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _float1Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    _float2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..repeat(reverse: true);

    _float3Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _sparkleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();

    _globeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat();

    Future.delayed(const Duration(milliseconds: 200), () {
      _logoController.forward();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      _textController.forward();
    });

    Timer(const Duration(milliseconds: 3000), widget.onComplete);
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _dotsController.dispose();
    _float1Controller.dispose();
    _float2Controller.dispose();
    _float3Controller.dispose();
    _sparkleController.dispose();
    _globeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF5B7FE3), Color(0xFF8B9FFF)],
          ),
        ),
        child: Stack(
          children: [
            // Floating background element 1
            Positioned(
              top: 80,
              left: 40,
              child: AnimatedBuilder(
                animation: _float1Controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, -20 * _float1Controller.value),
                    child: Transform.rotate(
                      angle: 0.087 * _float1Controller.value,
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Floating background element 2
            Positioned(
              bottom: 128,
              right: 48,
              child: AnimatedBuilder(
                animation: _float2Controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 20 * _float2Controller.value),
                    child: Transform.rotate(
                      angle: -0.087 * _float2Controller.value,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Floating background element 3
            Positioned(
              top: MediaQuery.of(context).size.height / 3,
              right: 32,
              child: AnimatedBuilder(
                animation: _float3Controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, -15 * _float3Controller.value),
                    child: Transform.scale(
                      scale: 1 + 0.1 * _float3Controller.value,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with animations
                  ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _logoController,
                      curve: Curves.elasticOut,
                    ),
                    child: FadeTransition(
                      opacity: _logoController,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 112,
                            height: 112,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.menu_book_rounded,
                              size: 56,
                              color: Color(0xFF5B7FE3),
                            ),
                          ),

                          // Sparkle icon
                          Positioned(
                            top: -8,
                            right: -8,
                            child: AnimatedBuilder(
                              animation: _sparkleController,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: 0.174 *
                                      (Tween<double>(begin: -1, end: 1)
                                                  .transform(
                                                      _sparkleController.value)
                                                  .abs() *
                                              2 -
                                          1),
                                  child: Transform.scale(
                                    scale: 1 +
                                        0.1 *
                                            (Tween<double>(begin: -1, end: 1)
                                                        .transform(
                                                            _sparkleController
                                                                .value)
                                                        .abs() *
                                                    2 -
                                                1),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFFFF5CC),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.auto_awesome,
                                        size: 20,
                                        color: Color(0xFF5B7FE3),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          // Globe icon
                          Positioned(
                            bottom: -8,
                            left: -8,
                            child: AnimatedBuilder(
                              animation: _globeController,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: 0.174 *
                                      (Tween<double>(begin: -1, end: 1)
                                                  .transform(
                                                      _globeController.value)
                                                  .abs() *
                                              2 -
                                          1),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE8E5F7),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.language,
                                      size: 20,
                                      color: Color(0xFF5B7FE3),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // EduVerse text
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.5),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _textController,
                      curve: Curves.easeOut,
                    )),
                    child: FadeTransition(
                      opacity: _textController,
                      child: const Text(
                        'EduVerse',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.5),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _textController,
                      curve: Curves.easeOut,
                    )),
                    child: FadeTransition(
                      opacity: _textController,
                      child: Text(
                        'Learn Beyond the Classroom',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Loading dots
                  FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _textController,
                      curve: Curves.easeIn,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return AnimatedBuilder(
                          animation: _dotsController,
                          builder: (context, child) {
                            final delay = index * 0.2;
                            final value =
                                (_dotsController.value - delay).clamp(0.0, 1.0);
                            final scale = Tween<double>(
                              begin: 1.0,
                              end: 1.5,
                            ).transform((value * 2).clamp(0.0, 1.0) -
                                ((value * 2 - 1).clamp(0.0, 1.0)));
                            final opacity = Tween<double>(
                              begin: 0.5,
                              end: 1.0,
                            ).transform((value * 2).clamp(0.0, 1.0) -
                                ((value * 2 - 1).clamp(0.0, 1.0)));

                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Transform.scale(
                                scale: scale,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(opacity),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
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
}
