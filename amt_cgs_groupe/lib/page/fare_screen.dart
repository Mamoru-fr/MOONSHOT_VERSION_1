// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:amt_cgs_groupe/page/widget/navigation.dart';
import 'package:amt_cgs_groupe/page/database/fare_database.dart';
import 'package:amt_cgs_groupe/page/database/data/fare.dart';


class FareSection extends StatefulWidget {
  const FareSection({super.key});

  @override
  State<FareSection> createState() => _FareSectionState();
}

class _FareSectionState extends State<FareSection> {
  static const int currentPage = 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text("Les Courses"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Fare>>(
        future : FareDatabase.instance.fare(),
        builder: (BuildContext context, AsyncSnapshot<List<Fare>> snapshot) {
          if (snapshot.hasData) {
            List<Fare> farelist = snapshot.data!;
            return ListView.builder(
              itemCount: farelist.length,
              itemBuilder: (context, index) { 
                final fare = farelist[index];
                return FareItemSection(fare: fare);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
      bottomNavigationBar: const NavigationSection(currentPage: currentPage),
    );
  }
}

class FareItemSection extends StatelessWidget {
  const FareItemSection({super.key, required this.fare});
  final dynamic fare;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/fare",
          arguments: fare,
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        color: Colors.lightBlueAccent.withOpacity(0.7),
        elevation: 8,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row( 
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      child: Image.asset(
                        'assets/images/production/bollore.png',
                        fit: BoxFit.contain,
                      ),
                      radius: 20,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            fare.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Text(
                          fare.payement,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 14,),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      );
  }
}

class FareCardSection extends StatelessWidget {
  const FareCardSection({super.key, required this.fare});
  final dynamic fare;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.all(8),
        color: Colors.lightBlueAccent.withOpacity(0.7),
        elevation: 8,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row( 
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      child: Image.asset(
                        'assets/images/production/bollore.png',
                        fit: BoxFit.contain,
                      ),
                      radius: 20,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            fare.title,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Text(
                          fare.payement,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 14,),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      );
  }
}