// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenue,', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              "Voulez-vous réservez un taxi ?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
        CircleAvatar(
          child: Image.asset('assets/images/avatar1.png',
            fit: BoxFit.cover,          
          ),
        ),
      ]),
    );
  }
}