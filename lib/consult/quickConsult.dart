import 'package:IcarePro/Models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickConsult extends StatefulWidget {
  const QuickConsult({super.key});

  @override
  State<QuickConsult> createState() => _QuickConsultState();
}

class _QuickConsultState extends State<QuickConsult> {
  List topDoctorsList = [
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Maria',
      'Neurologist | Max Clinic'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Stevi Jessi',
      'Dentist | King Hospital'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Monica',
      'Psychiatrist | KP Clinic'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Soumiya',
      'Orthopedic | Valley Hospital'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Praveen',
      'Neurologist | Max Clinic'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Ramya',
      'Dentist | King Hospital'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Priya',
      'Psychiatrist | KP Clinic'
    ],
    [
      'https://st2.depositphotos.com/2931363/6569/i/450/depositphotos_65699901-stock-photo-black-man-keeping-arms-crossed.jpg',
      'Dr. Soumiya',
      'Orthopedic | Valley Hospital'
    ],
  ];

  var availableDoctors = {
    'all': [],
    'general': [],
    'dentist': [],
    'ortho': [],
    'herbal': [],
    'neuro': []
  };
  Set vis = {};
  String doctorTypeClicked = 'all';

  var firestore = FirebaseFirestore.instance;
  
  List allDoctorAvailableTypes = ['dentist', 'general', 'herbal', 'ortho', 'neuro'];
 
  @override
  void initState() {
    super.initState();
    forAllDoctors(); // Populate all doctor types once the widget is initialized
  }

  Future forAllDoctors() async {
    for (String type in allDoctorAvailableTypes) {
      await getAllDoctors(type);
    }
    setState(() {}); // Update the state once all doctors are loaded
  }

  Future getAllDoctors(String type) async {
    final snapshot = await firestore
        .collection('doctors')
        .doc('y1AANmZ4BD7EOtGCzI6Q')
        .collection(type)
        .get();
    final doctor =
        snapshot.docs.map((e) => DoctorModel.doctorFromSnapshot(e)).toList();
    for (var tmp in doctor) {
      if (!vis.contains(tmp.id)) {
        vis.add(tmp.id);
        availableDoctors['all']
            ?.add([tmp.img, tmp.name, tmp.type, tmp.workAt, tmp.id]);
        availableDoctors[type]
            ?.add([tmp.img, tmp.name, tmp.type, tmp.workAt, tmp.id]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(Icons.arrow_back_ios_new_outlined)),
                    SizedBox(width: 15.0),
                    Text('Quick Consult',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                SizedBox(height: 15.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'all';
                          });
                        },
                        child: DoctorType(
                          containerColor: doctorTypeClicked == 'all'
                              ? Color.fromARGB(255, 73, 76, 237)
                              : Colors.white,
                          containerName: 'All',
                          isActive: doctorTypeClicked == 'all',
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'general';
                          });
                        },
                        child: DoctorType(
                          containerColor: doctorTypeClicked == 'general'
                              ? Color.fromARGB(255, 73, 76, 237)
                              : Colors.white,
                          containerName: 'General',
                          isActive: doctorTypeClicked == 'general',
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'neuro';
                          });
                        },
                        child: DoctorType(
                          containerColor: doctorTypeClicked == 'neuro'
                              ? Color.fromARGB(255, 73, 76, 237)
                              : Colors.white,
                          containerName: 'Neuro',
                          isActive: doctorTypeClicked == 'neuro',
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'dentist';
                          });
                        },
                        child: DoctorType(
                          containerColor: doctorTypeClicked == 'dentist'
                              ? Color.fromARGB(255, 73, 76, 237)
                              : Colors.white,
                          containerName: 'Dentist',
                          isActive: doctorTypeClicked == 'dentist',
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'herbal';
                          });
                        },
                        child: DoctorType(
                          containerColor: doctorTypeClicked == 'herbal'
                              ? Color.fromARGB(255, 73, 76, 237)
                              : Colors.white,
                          containerName: 'Herbal',
                          isActive: doctorTypeClicked == 'herbal',
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            doctorTypeClicked = 'ortho';
                          });
                        },
                        child: DoctorType(
                          containerColor: doctorTypeClicked == 'ortho'
                              ?const Color.fromARGB(255, 73, 76, 237)
                              : Colors.white,
                          containerName: 'Ortho',
                          isActive: doctorTypeClicked == 'ortho',
                        ),
                      ),
                    ],
                  ),
                ),
             const   SizedBox(height: 25),
            const    Row(
                  children: [
                    Text(
                      'Available Doctors',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ],
                ),
                Expanded(
                  child: availableDoctors[doctorTypeClicked]?.length != 0
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: availableDoctors[doctorTypeClicked]?.length,
                          itemBuilder: (context, idx) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/ParticularDoctor',
                                    arguments:
                                        QuickConsultParticularScreenArguments(
                                            name: availableDoctors[
                                                doctorTypeClicked]?[idx][1],
                                            id: availableDoctors[
                                                doctorTypeClicked]?[idx][4],
                                            type: availableDoctors[
                                                doctorTypeClicked]?[idx][2],
                                            img: availableDoctors[
                                                doctorTypeClicked]?[idx][0],
                                            workAt: availableDoctors[
                                                doctorTypeClicked]?[idx][3]),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 7),
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            availableDoctors[doctorTypeClicked]
                                                ?[idx][0]),
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            availableDoctors[doctorTypeClicked]
                                                ?[idx][1],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            availableDoctors[doctorTypeClicked]
                                                ?[idx][2],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            availableDoctors[doctorTypeClicked]
                                                ?[idx][3],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text('No Doctors available for this category.'),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorType extends StatelessWidget {
  final Color containerColor;
  final String containerName;
  final bool isActive;

  const DoctorType(
      {Key? key,
      required this.containerColor,
      required this.containerName,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
        border: isActive
            ? Border.all(color: Colors.blue, width: 2)
            : Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          containerName,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
