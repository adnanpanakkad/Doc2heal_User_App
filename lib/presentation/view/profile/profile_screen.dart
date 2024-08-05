import 'package:doc2heal/presentation/view/profile/editprofilr_screen.dart';
import 'package:doc2heal/services/firebase/firesbase_database.dart';
import 'package:doc2heal/utils/app_colors.dart';
import 'package:doc2heal/utils/app_text_styles.dart';
import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final User? curruser = FirebaseAuth.instance.currentUser;
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.lightbackground,
        appBar: DeatialAppbar(
          onTap: () {
            Navigator.pop(context);
          },
          text: 'Profile',
          centertitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<Map<String, dynamic>>(
              stream: UserRepository().getUserDetails(curruser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text('No Data Available'));
                }

                var userdata = snapshot.data ?? {};
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover, // Adjust image fit
                            image: userdata['coverimag'] != null
                                ? NetworkImage(userdata['coverimag'])
                                : AssetImage(
                                        'assets/default_profile_picture.png')
                                    as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(userdata['name'] ?? 'Unknown User',
                        style: CustomTextStyle.highboldTxtStyle),
                    const SizedBox(height: 8),
                    Text(
                      userdata['email'] ?? 'No Email Provided',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text('Phone'),
                            subtitle: Text(userdata['phone'] ??
                                'No Phone Number Provided'),
                          ),
                          ListTile(
                            leading: Icon(Icons.wc),
                            title: Text('Gender'),
                            subtitle: Text(
                                userdata['gender'] ?? 'No Gender Provided'),
                          ),
                          ListTile(
                            leading: Icon(Icons.cake),
                            title: Text('Age'),
                            subtitle:
                                Text(userdata['age'] ?? 'No Birthday Provided'),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                      userData: userdata,
                                    )));
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit Profile'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
