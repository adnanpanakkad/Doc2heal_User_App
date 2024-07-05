import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 240, 242),
        appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 70),
          child: DeatialAppbar(
            text: 'About Us',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .02),
          child: const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome to Doc2heal, your trusted partner in managing your health and wellness appointments effortlessly. MedHeal is designed to streamline the process of scheduling and managing doctor appointments, ensuring that you receive the care you need without the hassle.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Our Mission',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'At Doc2heal, our mission is to enhance the healthcare experience by providing a user-friendly platform that connects patients with healthcare providers seamlessly. We aim to simplify the appointment process, making it easier for you to access the medical attention you need, when you need it.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Key Features',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Doctor Scheduling:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Easily book appointments with your preferred healthcare professionals. Our intuitive scheduling system allows you to find and secure appointments that fit your schedule.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Manage Your Appointments:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Keep track of all your medical appointments in one place. View your upcoming, completed, and cancelled appointments with ease, so you never miss an important visit.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Payment Options:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Pay for your appointments directly or online. We offer flexible payment methods to ensure your convenience and peace of mind.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Notifications:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Stay informed with our local notifications feature. Receive reminders for your upcoming appointments one hour in advance, ensuring you are always prepared. Additionally, get notified when new doctors are appointed, keeping you updated on the latest additions to our healthcare network.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Why Choose MedHeal?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Convenience:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Our app is designed to make your life easier. From scheduling appointments to managing payments and receiving timely notifications, MedHeal covers all your healthcare needs.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Reliability:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'We partner with trusted healthcare providers to ensure you receive high-quality medical care. Our robust appointment system ensures that your booking is secure and reliable.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'User-Friendly Interface:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'MedHeal’s interface is intuitive and easy to navigate, making it simple for anyone to use. Whether you are tech-savvy or not, you’ll find our app straightforward and efficient.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Join Our Community',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Become a part of the MedHeal community and take control of your healthcare journey. Download the MedHeal Doctor Appointment App today and experience the future of medical appointment management.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Thank you for choosing MedHeal. Your health is our priority.',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ));
  }
}
