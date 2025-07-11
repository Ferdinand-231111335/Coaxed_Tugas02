import 'package:flutter/material.dart';
import 'providers/makhluk_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'providers/profile_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MakhlukProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: const MyAppWrapper(),
    ),
  );
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MyApp(themeProvider: themeProvider);
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final ThemeProvider themeProvider;
  const MyApp({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentTheme,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlueAccent,
        colorScheme: const ColorScheme.light(primary: Colors.blue),
        drawerTheme: const DrawerThemeData(backgroundColor: Colors.lightBlueAccent),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        cardColor: const Color.fromARGB(255, 17, 17, 61),
        scaffoldBackgroundColor: const Color.fromARGB(255, 5, 7, 119),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 5, 8, 161),
          foregroundColor: Colors.white,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 37, 89, 233),
          secondary: Colors.greenAccent,
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(Color.fromARGB(255, 37, 89, 233)),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyMedium: const TextStyle(color: Colors.white),
              titleLarge: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 5, 7, 119),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color.fromARGB(255, 30, 30, 60),
          labelStyle: const TextStyle(color: Colors.white70),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
