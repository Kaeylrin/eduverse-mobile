import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_dashboard_screen.dart';
import 'screens/subjects_screen.dart';
import 'screens/placeholder_screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const EduVerseApp());
}

class EduVerseApp extends StatelessWidget {
  const EduVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduVerse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B7FE3)),
      ),
      home: const AppNavigator(),
    );
  }
}

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  String currentScreen = 'splash';
  bool isAuthenticated = false;
  String userRole = 'student';
  Map<String, dynamic>? selectedSubject;
  Map<String, dynamic>? selectedModule;
  Map<String, dynamic>? selectedLesson;
  Map<String, dynamic>? selectedAssignment;
  Map<String, dynamic>? selectedQuiz;
  Map<String, dynamic>? selectedStudent;

  final List<String> teacherEmails = [
    '@eduverse-teacher.com',
    '@school-staff.edu',
    'teacher@eduverse.com',
    'admin@eduverse.com',
  ];

  bool isTeacherEmail(String email) {
    return teacherEmails
        .any((domain) => email.toLowerCase().contains(domain.toLowerCase()));
  }

  void handleSplashComplete() {
    setState(() => currentScreen = 'login');
  }

  void handleLogin(String email) {
    setState(() {
      isAuthenticated = true;
      userRole = isTeacherEmail(email) ? 'teacher' : 'student';
      currentScreen = userRole == 'teacher' ? 'teacher-dashboard' : 'home';
    });
  }

  void handleRegister() {
    setState(() {
      isAuthenticated = true;
      currentScreen = 'home';
    });
  }

  void handleLogout() {
    setState(() {
      isAuthenticated = false;
      currentScreen = 'login';
      selectedSubject = null;
      selectedModule = null;
      selectedLesson = null;
      selectedAssignment = null;
      selectedQuiz = null;
      selectedStudent = null;
    });
  }

  void handleNavigate(String page, [dynamic data]) {
    setState(() {
      if (page == 'subject-details' && data != null) selectedSubject = data;
      if (page == 'module-workspace' && data != null) selectedModule = data;
      if (page == 'lesson' && data != null) selectedLesson = data;
      if (page == 'assignment-details' && data != null)
        selectedAssignment = data;
      if (page == 'quiz' && data != null) selectedQuiz = data;
      if (page == 'teacher-student-profile' && data != null)
        selectedStudent = data;
      currentScreen = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (currentScreen) {
      case 'splash':
        screen = SplashScreen(onComplete: handleSplashComplete);
        break;
      case 'login':
        screen = LoginScreen(
          onLogin: handleLogin,
          onNavigateToRegister: () =>
              setState(() => currentScreen = 'register'),
        );
        break;
      case 'register':
        screen = RegisterScreen(
          onRegister: handleRegister,
          onNavigateToLogin: () => setState(() => currentScreen = 'login'),
        );
        break;
      case 'home':
        screen = HomeDashboard(onNavigate: handleNavigate);
        break;
      case 'subjects':
        screen = SubjectsScreen(onNavigate: handleNavigate);
        break;
      case 'subject-details':
        screen = SubjectDetailsScreen(
          subject: selectedSubject!,
          onBack: () => setState(() => currentScreen = 'subjects'),
          onStartModule: (module) {
            setState(() {
              selectedModule = module;
              currentScreen = 'module-workspace';
            });
          },
        );
        break;
      case 'modules':
        screen = ModulesScreen(onNavigate: handleNavigate);
        break;
      case 'module-workspace':
        screen = ModuleWorkspace(
          onBack: () => setState(() => currentScreen = 'subject-details'),
          onNavigate: handleNavigate,
        );
        break;
      case 'lesson':
        screen = LessonScreen(
          lesson: selectedLesson,
          onBack: () => setState(() => currentScreen = 'module-workspace'),
        );
        break;
      case 'assignments-list':
        screen = AssignmentsListScreen(
          onBack: () => setState(() => currentScreen = 'module-workspace'),
          onNavigate: handleNavigate,
        );
        break;
      case 'assignment-details':
        screen = AssignmentDetailsScreen(
          assignment: selectedAssignment!,
          onBack: () => setState(() => currentScreen = 'assignments-list'),
        );
        break;
      case 'quiz':
        screen = QuizScreen(
          quiz: selectedQuiz,
          onBack: () => setState(() => currentScreen = 'module-workspace'),
        );
        break;
      case 'pre-vr':
        screen = PreVRScreen(onNavigate: handleNavigate);
        break;
      case 'vr-entry':
        screen = VREntryScreen(onNavigate: handleNavigate);
        break;
      case 'grades':
        screen = const GradesScreen();
        break;
      case 'profile':
        screen = ProfileScreen(
          onLogout: handleLogout,
          onNavigate: handleNavigate,
          userRole: userRole,
        );
        break;
      case 'teacher-dashboard':
        screen = TeacherDashboard(onNavigate: handleNavigate);
        break;
      case 'teacher-modules':
        screen = TeacherModules(
          onBack: () => setState(() => currentScreen = 'teacher-dashboard'),
          onNavigate: handleNavigate,
        );
        break;
      case 'teacher-create-lesson':
        screen = TeacherCreateLesson(
          onBack: () => setState(() => currentScreen = 'teacher-dashboard'),
        );
        break;
      case 'teacher-create-assignment':
        screen = TeacherCreateAssignment(
          onBack: () => setState(() => currentScreen = 'teacher-dashboard'),
        );
        break;
      case 'teacher-vr-management':
        screen = TeacherVRManagement(
          onBack: () => setState(() => currentScreen = 'teacher-dashboard'),
        );
        break;
      case 'teacher-students':
        screen = TeacherStudents(
          onBack: () => setState(() => currentScreen = 'teacher-dashboard'),
          onNavigate: handleNavigate,
        );
        break;
      case 'teacher-student-profile':
        screen = TeacherStudentProfile(
          studentData: selectedStudent!,
          onBack: () => setState(() => currentScreen = 'teacher-students'),
        );
        break;
      default:
        screen = SplashScreen(onComplete: handleSplashComplete);
    }

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(maxWidth: 428),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 428),
            child: screen,
          ),
        ),
      ),
    );
  }
}
