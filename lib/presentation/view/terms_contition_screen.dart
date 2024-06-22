import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 70),
        child: DeatialAppbar(
          text: 'Terms & conditions',
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .03,
          vertical: size.height * .02,
        ),
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 10),
              Text(
                'Welcome to Doc2heal! These terms and conditions outline the rules and regulations for the use of our application.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Acceptance of Terms',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'By accessing and using the Doc2heal app, you accept and agree to be bound by the terms and provision of this agreement. In addition, when using this app’s services, you shall be subject to any posted guidelines or rules applicable to such services.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Modification of Terms',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Doc2heal reserves the right to modify these terms at any time. Your continued use of the app following any changes shall be deemed as your acceptance of such changes.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'User Responsibilities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'You agree to use Doc2heal only for lawful purposes. You are prohibited from using the app to post or transmit any material which is unlawful, harmful, threatening, abusive, harassing, defamatory, vulgar, obscene, or otherwise objectionable.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Account Security',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'You are responsible for maintaining the confidentiality of your account and password and for restricting access to your device. You agree to accept responsibility for all activities that occur under your account or password.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Your use of the app is also subject to our Privacy Policy. Please review our Privacy Policy, which also governs the app and informs users of our data collection practices.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Limitation of Liability',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Doc2heal will not be liable for any damages of any kind arising from the use of this app, including, but not limited to direct, indirect, incidental, punitive, and consequential damages.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Governing Law',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'These terms and conditions are governed by and construed in accordance with the laws of [Your Country/State], and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'If you have any questions about these Terms, please contact us at support@doc2heal.com.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
