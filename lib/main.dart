import 'View/Screens/create_story_screen.dart';
import 'View/Screens/home_page.dart';
import 'View/Screens/sign_upscreen.dart';
import 'core/constants/route_names.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';
import 'features/onboarding/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          initialRoute: RouteNames.splash,
          routes: {
            RouteNames.splash: (context) => SplashScreen(),
            RouteNames.onboarding: (context) => OnboardingScreen(),
            RouteNames.signUp: (context) => SignUpScreen(),
            RouteNames.login: (context) => LoginScreen(),
            RouteNames.home: (context) => const HomePage(),
            RouteNames.createStory: (context) => const CreateStoryScreen(),
          },
        );
      },
      child: const CreateStoryScreen(),
    );
  }
}
