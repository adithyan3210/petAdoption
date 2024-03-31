import 'package:flutter/material.dart';
import 'package:petnymble/provider/history_provider.dart';
import 'package:petnymble/provider/pet_provider.dart';
import 'package:petnymble/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => PetProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).getTheme,
      home: const IntroScreen(),
    );
  }
}
