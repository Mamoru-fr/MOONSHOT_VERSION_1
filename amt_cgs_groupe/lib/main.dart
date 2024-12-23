import 'package:amt_cgs_groupe/page/fare_screen.dart';
import 'package:amt_cgs_groupe/page/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      title: "AMT CGS GROUPE",
      home: const Scaffold(
        body: Center(
          child: homepage(),
        ),
      ),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/' : 
        return MaterialPageRoute(builder: (context) => const homepage());
      case "/fare": 
        return PageRouteBuilder(
            pageBuilder: (context, anismation, scondaryanimation) => FareItemSection(fare: settings.arguments),
            transitionsBuilder: (context, animation, secondaryanimation, child) {
              var begin = const Offset(0.0,1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
                );
            }
          );
      default: 
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text("Error"), centerTitle: true),
          body : const Center(
            child: Text("Page not found"),
          ),
          ),
        );
    }
  }
}
