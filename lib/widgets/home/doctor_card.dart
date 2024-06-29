import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/presentation/view/booking_screen.dart';
import 'package:doc2heal/services/firebase/firesbase_database.dart';
import 'package:flutter/material.dart';

class DoctorGrid extends StatelessWidget {
  const DoctorGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: UserRepository().getDoctors(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final doctorDocs = snapshot.data!.docs;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.66,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            final doctor = doctorDocs[index].data() as Map<String, dynamic>;
            final doctorName =
                'Dr. ${doctor['name'][0].toUpperCase() + doctor['name'].substring(1)}';
            final category = doctor['specialization'] ?? 'Category';
            final imageUrl = doctor['doctorimg'] ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVAAtEKf0r5SivJpR8Ek-crrJ3fWtSMknuzg&s';

            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BookingScreen(
                          doctorData: doctor,
                          userId: doctor['uid'],
                        )));
              },
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Image.network(
                          width: 150,
                          imageUrl,
                          fit: BoxFit.cover,
                          height: 185,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        doctorName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
