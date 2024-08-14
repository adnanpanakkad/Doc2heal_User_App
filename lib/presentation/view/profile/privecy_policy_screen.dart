import 'package:flutter/material.dart';
import 'package:doc2heal/widgets/common/appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeatialAppbar(
        text: 'Privacy Policy',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Last updated: Aug 05, 2024',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              '1. Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to Doc2heal! This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully to understand our views and practices regarding your personal data and how we will treat it.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Information We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            const Text(
              'We may collect and process the following data about you:\n\n'
              'a. Personal Identification Information (PII): Name, email address, phone number, etc.\n'
              'b. Health Information: Medical history, symptoms, prescriptions, etc.\n'
              'c. Usage Data: Details of your use of our app including traffic data, location data, and other communication data.\n'
              'd. Device Information: Information about the device you use to access our app.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3. How We Use Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We use the information we collect in the following ways:\n\n'
              'a. To provide and maintain our services.\n'
              'b. To manage your account and provide customer support.\n'
              'c. To notify you about changes to our services.\n'
              'd. To allow you to participate in interactive features of our app.\n'
              'e. To monitor the usage of our app and improve its functionality.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '4. Disclosure of Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may share your information in the following situations:\n\n'
              'a. With healthcare providers for the purpose of providing medical consultation.\n'
              'b. With third-party service providers who perform services on our behalf.\n'
              'c. In connection with a merger, sale, or transfer of assets.\n'
              'd. To comply with legal obligations or to protect our rights.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '5. Security of Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We use administrative, technical, and physical security measures to protect your personal data. However, no method of transmission over the Internet or method of electronic storage is 100% secure.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '6. Your Data Protection Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Depending on your location, you may have the following rights regarding your personal data:\n\n'
              'a. The right to access – You have the right to request copies of your personal data.\n'
              'b. The right to rectification – You have the right to request that we correct any information you believe is inaccurate.\n'
              'c. The right to erasure – You have the right to request that we erase your personal data.\n'
              'd. The right to restrict processing – You have the right to request that we restrict the processing of your personal data.\n'
              'e. The right to object to processing – You have the right to object to our processing of your personal data.\n'
              'f. The right to data portability – You have the right to request that we transfer your data to another organization.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '7. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '8. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions about this Privacy Policy, please contact us at:\n\n'
              'Email: support@doc2heal.com\n'
              'Phone: +1 234 567 890',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
