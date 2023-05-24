import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/data/repo/auth_repository.dart';
import 'package:restaurant/data/repo/menu_repository.dart';
import '../providers/app_provider.dart';
import 'ui/screens/splash.dart';
import '../util/const.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  authRepository.loadAuthInfo();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, _) {
        return MaterialApp(
            key: appProvider.key,
            debugShowCheckedModeBanner: false,
            navigatorKey: appProvider.navigatorKey,
            title: Constants.appName,
            theme: appProvider.theme,
            darkTheme: Constants.darkTheme,
            home: SplashScreen());
      },
    );
  }
}
