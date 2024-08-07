import 'package:flutter/material.dart';

class CompletescheduleCard extends StatelessWidget {
  final String? docName;
  final String? docimgurl;
  final String? specialization;
  final String? time;
  final String? date;
  final String? id;
  final bool? selected;
  final void Function()? onTap;

  const CompletescheduleCard({
    super.key,
    required this.docName,
    required this.docimgurl,
    required this.specialization,
    required this.time,
    required this.date,
    required this.id,
    this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage(docimgurl!), // Use actual image URL
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr.${docName![0].toUpperCase()}${docName!.substring(1)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(specialization!),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 5),
                    Text(date!),
                    const SizedBox(width: 20),
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 5),
                    Text(time!),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 12),
                    SizedBox(width: 5),
                    Text('Completed'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Reschedule'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
