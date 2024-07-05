import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc2heal/services/firebase/firesbase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, dynamic>>(
        stream: UserRepository().getUserDetails(user!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Data Available'));
          }

          var userData = snapshot.data ?? {};
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromARGB(255, 143, 189, 198),
                            backgroundImage: NetworkImage(
                              userData['coverimag'] ??
                                  const AssetImage('assets/Ellipse 1.png'),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome',
                              style: TextStyle(
                                color: Color.fromARGB(255, 155, 141, 143),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              userData['name'].toUpperCase(),
                              style: const TextStyle(
                                color: Color(0xFF1D1617),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none_rounded,
                            size: 30,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.favorite_border_rounded,
                        //     size: 28,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        });
  }
}
