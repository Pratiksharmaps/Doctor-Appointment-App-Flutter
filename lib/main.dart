import 'package:IcarePro/Appointment/appointments.dart';
import 'package:IcarePro/Cart/cart.dart';
import 'package:IcarePro/Online%20Medicines/onlineMedicines.dart';
import 'package:IcarePro/ProfilePage/profilePage.dart';
import 'package:IcarePro/SignUp/signUp.dart';
import 'package:IcarePro/Specialist%20Page/specialistScreen.dart';
import 'package:IcarePro/Test/labTest.dart';
import 'package:IcarePro/Test/testScreen.dart';
import 'package:IcarePro/Top%20Categories/topCategories.dart';
import 'package:IcarePro/consult/quickConsult.dart';
import 'package:IcarePro/consult/quickConsultParticular.dart';
import 'package:IcarePro/home/homeScreen.dart';
import 'package:IcarePro/login/login.dart';
import 'package:IcarePro/schedule/schedulePage.dart';
import 'package:IcarePro/splashScreen/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDYdM665IPafwJrkWrxw0MmntLvpIgzyrg",
          appId: "1:637556793314:android:0cccf16e745833d680a3bb",
          messagingSenderId: "com.example.doctors_appointment",
          storageBucket: "doctorappointment-65111.appspot.com",
          projectId: "doctorappointment-65111"));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email = '';

  String password = '';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool loginState = false;

  Future getUserDetails() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      loginState = prefs.getBool('loginState') ?? false;
    });
  }

  @override
  void initState() {
    getUserDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(loginState: loginState),
      // home : Profilepage(),
      // home: CallApi(),
      // home : (loginState == true) ? Homescreen() : LoginPage(),
      routes: {
        '/homeScreen': (context) => Homescreen(),
        '/quickConsult': (context) => QuickConsult(),
        '/ParticularDoctor': (context) => ParticularDoctor(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpApp(),
        '/scheduleAppointment': (context) => ScheduleAppointment(),
        '/LabTest': (context) => LabTest(),
        '/TestScreen': (context) => MyTestScreen(),
        '/Appointments': (contex) => Appointments(),
        '/OnlineMedicine': (context) => Onlinemedicines(),
        '/CartScreen': (context) => MyCartScreen(),
        '/TopCategories': (context) => Topcategories(),
        '/specialisityScreen': (context) => Specialistscreen(),
        '/cartScreen': (context) => MyCartScreen(),
        '/ProfilePage': (context) => Profilepage(),
        '/BottomNav': (context) => BottomAppBar(),
      },
    );
  }
}
