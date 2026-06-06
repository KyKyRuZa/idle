import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/game_provider.dart';
import 'screens/home_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/upgrades_screen.dart';
import 'screens/settings_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: IdleStrongholdApp()));
}

class IdleStrongholdApp extends StatelessWidget {
  const IdleStrongholdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idle Stronghold',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.depthBackgrounds[0],
        primaryColor: AppColors.primary,
        textTheme: GoogleFonts.cinzelTextTheme().apply(
          bodyColor: AppColors.textOnDark,
          displayColor: AppColors.textOnDark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF000000),
          iconTheme: IconThemeData(color: AppColors.primary),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _MainScreenContent();
  }
}

class _MainScreenContent extends StatefulWidget {
  const _MainScreenContent({super.key});

  @override
  State<_MainScreenContent> createState() => _MainScreenContentState();
}

class _MainScreenContentState extends State<_MainScreenContent> with WidgetsBindingObserver {
  final List<Widget> _screens = const [
    HomeScreen(),
    ShopScreen(),
    UpgradesScreen(),
    SettingsScreen(),
  ];
  int _currentIndex = 0;
  ProviderContainer? _container;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _container = ProviderScope.containerOf(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      if (_container != null) {
        _container!.read(gameProvider.notifier).manualSave();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey.shade600,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Магазин',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upgrade),
            label: 'Улучшения',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}