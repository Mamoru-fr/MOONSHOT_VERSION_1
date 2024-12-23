// ignore_for_file: file_names
import 'package:amt_cgs_groupe/Page/Profile.dart';
import 'package:amt_cgs_groupe/page/fare_screen.dart';
import 'package:flutter/material.dart';
import 'package:amt_cgs_groupe/Page/Home.dart';
import 'package:amt_cgs_groupe/Page/reservation.dart';

class NavigationSection extends StatelessWidget {
  
  final int currentPage;

  const NavigationSection({super.key, required this.currentPage});
  
  static List<Widget> pages = [
      const homepage(),
      const FareSection(),
      const ReservationsPage(),
      const ProfilePage()
    ];

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Container(
        decoration : BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10),
          ]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        child: BottomNavigationBar(
          currentIndex: currentPage,
            onTap: (value) {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pages[value]));
            },
          selectedItemColor: Colors.blue,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label : 'Home',
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.home_rounded,
                  size: 30,
                ),
              ),
              ),
              BottomNavigationBarItem(
              label : 'Courses',
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.assignment_rounded,
                  size: 30,
                  ),
              ),
              ),
              BottomNavigationBarItem(
              label : 'Réservations',
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.date_range_outlined,
                  size: 30,
                  ),
              ),
              ),
              BottomNavigationBarItem(
              label : 'Profil',
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.account_circle_rounded,
                  size: 30,
                  ),
              ),
              ),
          ]),
        ),
      ),
    );
  }
}