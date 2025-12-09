import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/grades_screen.dart';
import 'screens/timetable_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mój Dziennik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/grades': (context) => const GradesScreen(),
        '/timetable': (context) => const TimetableScreen(),
      },
    );
  }
}
