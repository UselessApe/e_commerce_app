import 'package:e_commerce_app/app/providers.dart';
import 'package:e_commerce_app/widgets/product_banner.dart';
import 'package:e_commerce_app/widgets/product_display.dart';
import 'package:e_commerce_app/widgets/user_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserHome extends ConsumerWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserTopBar(
                leadingIconButton: IconButton(
                  onPressed: () {
                    ref.read(firebaseAuthProvider).signOut();
                  },
                  icon: const Icon(Icons.logout),
                ),
              ),
              const SizedBox(height: 20),
              const ProductBanner(),
              const SizedBox(height: 20),
              const Text(
                "Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "View all of our Products",
                style: TextStyle(fontSize: 12),
              ),
              const ProductDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
