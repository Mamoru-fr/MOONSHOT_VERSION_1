// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Widget/Navigation.dart';

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
        bottomNavigationBar: NavigationSection(currentPage: currentPage,),
    );
  }
}