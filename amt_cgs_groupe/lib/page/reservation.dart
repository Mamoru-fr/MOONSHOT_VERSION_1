// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:amt_cgs_groupe/Page/Widget/Navigation.dart';
import 'Widget/Header.dart';
import 'Widget/Search.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  int currentPage = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.blue,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.red,
              height: 200,
            ),
            const Column(
              children: [
                HeaderSection(),
                Searchsection(),
              ],
            )
          ],
        ),
        ),
        bottomNavigationBar: NavigationSection(currentPage: currentPage,),
    );
  }
}