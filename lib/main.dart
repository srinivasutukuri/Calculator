import 'package:calculater_2/firebase_options.dart';
import 'package:calculater_2/provider/homeprovider.dart';
import 'package:calculater_2/views/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Homeprovider())],
      child: const MaterialApp(
        home: Homescreen(),
      ),
    );
  }
}
