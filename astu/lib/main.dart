// ignore_for_file: prefer_const_constructors

import 'package:astu/clubs/Roundedclub.dart';
import 'package:astu/clubs/a2sv.dart';
import 'package:astu/clubs/antidrug.dart';
import 'package:astu/clubs/csec.dart';
import 'package:astu/clubs/spacescience.dart';
import 'package:astu/course/applied2.dart';
import 'package:astu/curriculum/csec.dart';
import 'package:astu/curriculum/electronics.dart';
import 'package:astu/curriculum/mechanical/materail.dart';
import 'package:astu/curriculum/mechanical/mechanical.dart';
import 'package:astu/curriculum/power.dart';
import 'package:astu/curriculum/software.dart';
import 'package:astu/maps/libraries.dart';
import 'package:astu/screens/feature.dart';
import 'package:astu/screens/landings.dart';
import 'package:astu/screens/mapscreen.dart';
import 'package:astu/screens/phone.dart';
import 'package:astu/screens/place.dart';
import 'package:astu/screens/schedule.dart';
import 'package:flutter/material.dart';
import 'package:astu/screens/discover.dart';
import 'package:astu/screens/home.dart';
import 'package:astu/screens/rulespage.dart';
import 'package:astu/screens/cgpa.dart';
import 'package:astu/screens/schoollist.dart';
import 'package:astu/schooldept/applied.dart';
import 'package:astu/schooldept/mechanical.dart';
import 'package:astu/schooldept/civil.dart';
import 'package:astu/schooldept/electrical.dart';
import 'package:astu/screens/gpa.dart';
import 'package:astu/screens/clubs.dart';
import 'package:astu/screens/mealplan.dart';
import 'package:astu/screens/searchcourse.dart';
import 'package:astu/course/applied.dart';
import 'package:astu/screens/database.dart';
import 'package:astu/screens/start.dart';
import 'package:astu/screens/user_list_screen.dart';

void main() {
  runApp(const MyAppLoader());
}

class MyAppLoader extends StatelessWidget {
  const MyAppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkDatabaseEmpty(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            ),
          );
        } else {
          return MyApp(isDatabaseEmpty: snapshot.data!);
        }
      },
    );
  }

  Future<bool> _checkDatabaseEmpty() async {
    final DatabaseHelper databaseHelper = DatabaseHelper();
    final users = await databaseHelper.getUsers();
    return users.isEmpty;
  }
}

class MyApp extends StatelessWidget {
  final bool isDatabaseEmpty;

  // ignore: use_key_in_widget_constructors
  const MyApp({required this.isDatabaseEmpty});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQLite Demo',
      initialRoute: isDatabaseEmpty ? InsertScreen.id : LandingPage.id,
      routes: {
        InsertScreen.id: (context) => InsertScreen(),
        DiscoveryPage.id: (context) => DiscoveryPage(),
        Electrical.id: (context) => Electrical(),
        Civil.id: (context) => Civil(),
        Electrical.id: (context) => Electrical(),
        Mechanical.id: (context) => Mechanical(),
        SchoolList.id: (context) => SchoolList(),
        Applied.id: (context) => Applied(),
        GradeInputForm.id: (context) => GradeInputForm(),
        Cumulative.id: (context) => Cumulative(),
        Clubs.id: (context) => Clubs(),
        MealSchedule.id: (context) => MealSchedule(),
        Courses.id: (context) => Courses(),
        AppliedmathsII.id: (context) => AppliedmathsII(),
        AppliedmathsI.id: (context) => AppliedmathsI(),
        LandingPage.id: (context) => LandingPage(),
        MapScreen.id: (context) => MapScreen(),
        Phone.id: (context) => Phone(),
        Softwareabout.id: (context) => Softwareabout(),
        Cse.id: (context) => Cse(),
        Electronics.id: (context) => Electronics(),
        Power.id: (context) => Power(),
        Csec.id: (context) => Csec(),
        A2sv.id: (context) => A2sv(),
        AntiDrug.id: (context) => AntiDrug(),
        Space.id: (context) => Space(),
        Place.id: (context) => Place(),
        SampleMap.id: (context) => SampleMap(),
        Schedule.id: (context) => Schedule(),
        Rulespage.id: (context) => Rulespage(),
        Mechanicalabout.id: (context) => Mechanicalabout(),
        Materialabout.id:(context)=>Materialabout()
        
      },
    );
  }
}
