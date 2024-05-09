import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zed_stores/authentication/auth_methods.dart';
import 'package:zed_stores/pages/login_screen.dart';
import 'package:zed_stores/services/user.dart';

class AccountManagementPage extends StatefulWidget {
  const AccountManagementPage({super.key});

  @override
  State<AccountManagementPage> createState() => _AccountManagementPageState();
}

class _AccountManagementPageState extends State<AccountManagementPage> {
  User? currentUser;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await getUserData();
    }
  }

  Future<void> getUserData() async {
    try {
      // Reference to the Firestore collection "users"
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Get the document snapshot for the current user
      DocumentSnapshot userSnapshot =
          await usersCollection.doc(currentUser?.uid).get();

      print(userSnapshot.exists);
      // Check if the document exists and contains data
      if (userSnapshot.exists && userSnapshot.data() != null) {
        // Get user data as a Map
        userData = userSnapshot.data() as Map<String, dynamic>;
      } else {
        // If the document does not exist or has no data, set userData to an empty map
        userData = {};
      }

      print(userData);

      // Update the UI
      setState(() {});
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void logOut() {
    FireBaseAuthMethods(FirebaseAuth.instance).signOut();
  }

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Management',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            onPressed: () {
              // Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/product2.jpeg'), // Replace with your user's avatar
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentUser?.displayName ?? 'Guest',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Member Since: ${currentUser?.metadata.creationTime != null ? DateFormat('yyyy-MM-dd').format(currentUser!.metadata.creationTime!) : 'N/A'}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Make Drawer items
            ListTile(
              dense: true,
              leading: const Icon(Icons.shopping_cart_outlined),
              title: const Text('Purchases'),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.message_outlined),
              title: const Text('Messages'),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('Selling'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              dense: true,
              leading: const Icon(Icons.payment_outlined),
              title: const Text('Payments'),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Log Out'),
              onTap: () {
                logOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
