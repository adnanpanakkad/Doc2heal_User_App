import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:flutter/material.dart';

class PrivecyPolicyScreen extends StatelessWidget {
  const PrivecyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, 70),
            child: DeatialAppbar(
                text: 'PrivecyPolicy',
                onTap: () {
                  Navigator.pop(context);
                })),
    );
  }
}
