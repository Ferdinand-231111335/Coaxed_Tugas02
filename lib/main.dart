import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/makhluk_provider.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MakhlukProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentTheme,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlueAccent,
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
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
      ),
      home: const LoginScreen(),
    );
  }
}
