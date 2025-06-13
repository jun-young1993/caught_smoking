import 'package:caught_smoking/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/constants/juny_constants.dart';
import 'package:flutter_common/network/dio_client.dart';
import 'package:flutter_common/providers/common_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(
      child: CommonProvider(
        dioClient: DioClient(),
        sharedPreferences: await SharedPreferences.getInstance(),
        appKey: AppKeys.caughtSmoking,
        child: MainScreen(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget child;
  const MyApp({super.key, required this.child});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: JunyConstants.appNames[AppKeys.caughtSmoking],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: child,
    );
  }
}
