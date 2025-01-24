import 'package:bilytica/services/api_service.dart';
import 'package:bilytica/providers/dating_provider.dart';
import 'package:bilytica/screens/dating_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // Status bar color
    statusBarIconBrightness: Brightness.dark, // For Android: dark icons
    statusBarBrightness: Brightness.light, // For iOS: dark icons
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DatingProvider(ApiService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Disable the debug banner
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DatingCardList(),
      ),
    );
  }
}
