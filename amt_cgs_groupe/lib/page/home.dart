import 'package:amt_cgs_groupe/page/widget/header.dart';
import 'package:amt_cgs_groupe/page/widget/navigation.dart';
import 'package:amt_cgs_groupe/page/widget/search.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 180,
            ),
            const HeaderSection(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 70),
              child: Searchsection(),
              ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationSection(currentPage: currentPage),
    );
  }
}

// ignore: unused_element
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Icon(icon,color: color,)),
      Text(label, style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color)),
    ],
  );
}