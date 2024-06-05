// import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/controller/add_user_controller.dart';
import 'package:project/controller/auth_controller.dart';
import 'package:project/controller/promoter_user_controller.dart';
import 'package:project/view/login_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate(
  //   webProvider: ReCaptchaV3Provider('your-site-key'),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthController>(
          create: (_) => AuthController(),
        ),
        Provider<PromoterUserController>(
            create: (_) => PromoterUserController()..fetchUsers()),
        Provider<AddUserSalaController>(
          create: (_) => AddUserSalaController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginForm(),
      ),
    );
  }
}
