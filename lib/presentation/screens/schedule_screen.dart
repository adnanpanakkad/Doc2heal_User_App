import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doc2heal/utils/app_text_styles.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Schedules',
                style: CustomTextStyle.highboldTxtStyle,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Example: 5 appointments
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text('Appointment ${index + 1}'),
                        subtitle: Text('Dr. John Doe - 10:00 AM, May 15, 2024'),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Navigate to edit appointment screen
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add appointment screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
