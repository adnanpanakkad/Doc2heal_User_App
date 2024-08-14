import 'package:doc2heal/widgets/common/appbar.dart';
import 'package:doc2heal/widgets/profile/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 240, 242),
        appBar: DeatialAppbar(
          text: 'About Us',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .02),
          child: SingleChildScrollView(
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
              CustomRow(
                  leadingIcon: Icons.mail_outline_outlined,
                  text: 'doc2healsupport@gmail.com',
                  trailingIcon: Icons.abc,
                  onTrailingIconPressed: () async {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'doc2healsupport@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': 'Error on Doc2heal app',
                        'body': 'if have any queries fell free to connect'
                      }),
                    );

                    launchUrl(emailLaunchUri);
                  }),
              CustomRow(
                  leadingIcon: Icons.abc,
                  text: 'text',
                  trailingIcon: Icons.abc,
                  onTrailingIconPressed: () {}),
              SizedBox(
                height: 20,
              ),
              Text(
                'App version: 1.0.1',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ]),
          ),
        ));
  }
}
