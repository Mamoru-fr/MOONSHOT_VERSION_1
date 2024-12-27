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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Card(
        margin: EdgeInsets.zero,
        color: Colors.purple,
        elevation: 8,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: Row( 
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 411,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 85),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)
                            )
                          ),
                          child: Text(
                            "Details de la Course",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 55,
                              width: 180,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(100, 30, 200, 100),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Date : ${fare.Date}",
                                style: TextStyle(fontSize: 16, color : Colors.white),
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              height: 55,
                              width: 180,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(100, 30, 200, 100),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Heure : ${fare.Hour}",
                                style: TextStyle(fontSize: 16, color : Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 100,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(100, 30, 200, 100),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 5,),
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
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${fare.ID_client}",
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 16, color : Colors.white),
                                      ),
                                    ),
                                  ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(100, 30, 200, 100),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tarif : ${fare.Hour}",
                                    style: TextStyle(fontSize: 16, color : Colors.white),
                                  ),
                                  Text(
                                    "${fare.payement}",
                                    style: TextStyle(fontSize: 14, color : Colors.red, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          height: 80,
                          width: 372,
                          decoration: BoxDecoration(
                                color: const Color.fromRGBO(100, 30, 200, 100),
                                borderRadius: BorderRadius.circular(20),
                              ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Option(s) : ${fare.option}",
                            maxLines: 2,
                            style: TextStyle(fontSize: 16, color : Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 120,
                              width: 180,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(100, 30, 200, 100),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Depart :",
                                    style: TextStyle(fontSize: 16, color : Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "${fare.ID_depart}",
                                    style: TextStyle(fontSize: 16, color : Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              height: 120,
                              width: 180,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(100, 30, 200, 100),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Arrivée :",
                                    style: TextStyle(fontSize: 16, color : Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "${fare.ID_arrive}",
                                    style: TextStyle(fontSize: 16, color : Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          height: 372,
                          width: 372,
                          decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                          alignment: Alignment.center,
                          child: Text(
                            "MAP",
                            style: TextStyle(fontSize: 16, color : Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20)
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