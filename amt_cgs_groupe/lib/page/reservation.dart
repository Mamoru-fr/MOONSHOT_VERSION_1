import 'package:flutter/material.dart';
import 'package:amt_cgs_groupe/page/widget/navigation.dart';
import 'package:amt_cgs_groupe/page/widget/header.dart';
import 'package:amt_cgs_groupe/page/widget/search.dart';


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