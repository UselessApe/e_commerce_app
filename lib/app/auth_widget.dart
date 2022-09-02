import 'package:e_commerce_app/app/providers.dart';
import 'package:e_commerce_app/models/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
    required this.adminSignedInBuilder,
  }) : super(key: key);
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder adminSignedInBuilder;

  final adminEmail = "admin@admin.com"; //TODO store this somewhere else on prod

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    const adminEmail = "admin@admin.com";

    return authStateChanges.when(
      data: (user) => user != null
          ? user.email == adminEmail //TODO store this somewhere else on prod
              ? adminSignedInBuilder(context)
              : signedInBuilder(context)
          : nonSignedInBuilder(context),
      error: (_, __) => const Scaffold(
        body: Center(
          child: Text("Something went wrong!"),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  FutureBuilder<UserData?> signedInHandler(context, WidgetRef ref, User user) {
    final database = ref.read(databaseProvider)!;
    final potentialUserFuture = database.getUser(user.uid);
    return FutureBuilder<UserData?>(
        future: potentialUserFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final potentialUser = snapshot.data;
            if (potentialUser == null) {
              database.addUser(UserData(
                  email: user.email != null ? user.email! : "", uid: user.uid));
            }
            if (user.email == adminEmail) {
              return adminSignedInBuilder(context);
            }
            return signedInBuilder(context);
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
