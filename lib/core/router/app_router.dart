import 'package:go_router/go_router.dart';
import '../../presentation/screens/cities_screen.dart';
import '../../presentation/screens/diplomacy_screen.dart';
import '../../presentation/screens/economy_screen.dart';
import '../../presentation/screens/events_screen.dart';
import '../../presentation/screens/government_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/laws_screen.dart';
import '../../presentation/screens/military_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/technology_screen.dart';
import '../../presentation/screens/world_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/world', builder: (context, state) => const WorldScreen()),
    GoRoute(
      path: '/government',
      builder: (context, state) => const GovernmentScreen(),
    ),
    GoRoute(
      path: '/military',
      builder: (context, state) => const MilitaryScreen(),
    ),
    GoRoute(
      path: '/economy',
      builder: (context, state) => const EconomyScreen(),
    ),
    GoRoute(
      path: '/technology',
      builder: (context, state) => const TechnologyScreen(),
    ),
    GoRoute(
      path: '/diplomacy',
      builder: (context, state) => const DiplomacyScreen(),
    ),
    GoRoute(path: '/cities', builder: (context, state) => const CitiesScreen()),
    GoRoute(path: '/laws', builder: (context, state) => const LawsScreen()),
    GoRoute(path: '/events', builder: (context, state) => const EventsScreen()),
  ],
);
