import 'package:e_commerce_app/app/auth_widget.dart';
import 'package:e_commerce_app/app/pages/admin/admin_home.dart';
import 'package:e_commerce_app/app/pages/auth/sign_in/sign_in_page.dart';
import 'package:e_commerce_app/app/pages/user/user_home.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWidget(
        adminSignedInBuilder: (context) => AdminHome(),
        nonSignedInBuilder: (_) => const SignInPage(),
        signedInBuilder: (context) => UserHome(),
      ),
    );
  }
}
