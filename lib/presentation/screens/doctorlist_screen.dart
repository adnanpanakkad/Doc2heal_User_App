import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/presentation/screens/booking_screen.dart';
import 'package:doc2heal/services/firebase/firestore.dart';
import 'package:flutter/material.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Doctors List'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: UserRepository().getDoctors(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong!'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> doctorData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(doctorData['imagepath'] ??
                      ''), // Ensure image path is valid
                ),
                title: Text(doctorData['name'] ?? ''), // Ensure name is valid
                subtitle: Text(
                    doctorData['birthday'] ?? ''), // Ensure birthday is valid
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingScreen(
                        doctorData: doctorData,
                        userId: doctorData['id'],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
