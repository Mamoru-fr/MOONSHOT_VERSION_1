import 'package:flutter/material.dart';
import 'package:amt_cgs_groupe/page/widget/navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentPage = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.purple,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.orange,
              height: 200,
            ),
          ],
        ),
        ),
        bottomNavigationBar: NavigationSection(currentPage: currentPage),
    );
  }
}