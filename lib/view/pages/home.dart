import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/sharedUi/resume_widget.dart';
import 'package:task_management/view/pages/add.dart';
import 'package:task_management/view/pages/course.dart';
import 'package:task_management/view/pages/work.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../sharedUi/skills.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: CurvedNavigationBar(
          height: 45,
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            } else if (index == 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddWork()));
            } else if (index == 2) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Work()));
            }
          },
          backgroundColor: Color.fromARGB(255, 59, 94, 60),
          //backgroundColor: Color.fromARGB(255, 34, 119, 37),
          items: const [
            Icon(Icons.home),
            Icon(Icons.add),
            Icon(Icons.work),
          ],
        ),
        body: Row(
          children: [
            Container(
              width: 180,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45),
                      bottomRight: Radius.circular(45)),
                  color: Color.fromARGB(255, 59, 94, 60)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Resume',
                      style: GoogleFonts.fingerPaint(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 150,
                  //   height: 150,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(70),
                  //       image: DecorationImage(
                  //           image: AssetImage('assets/images/avatar.jpg'),
                  //           fit: BoxFit.cover)),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                        'assets/images/avatar.jpg',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sojod Talaat',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                  const Text(
                    'software Enginering ',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ResumeWidget(
                      icon: Icons.location_city_outlined,
                      text: 'Palestine/Gaza'),
                  InkWell(
                      onTap: () {
                        // ignore: deprecated_member_use
                        //
                      },
                      child: ResumeWidget(
                          icon: Icons.email, text: 'sjd@gmail.com')),
                  InkWell(
                      onTap: () {
                        // ignore: deprecated_member_use
                        launch(
                            "whatsapp://send?phone=972595536970&text=${Uri.encodeFull('how i can help you')}");
                        //_makePhoneCall('0595536970');
                      },
                      child: ResumeWidget(
                          icon: Icons.whatsapp, text: '0595536970')),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        Text(
                          'languages',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ResumeWidget(icon: Icons.done, text: 'Arabic'),
                  ResumeWidget(icon: Icons.done, text: 'English'),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        Text(
                          'Hobbies',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ResumeWidget(icon: Icons.abc, text: 'reading'),
                  ResumeWidget(icon: Icons.abc, text: 'writting'),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      'About Me:',
                      style: GoogleFonts.lobster(fontSize: 18),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 12),
                      margin: const EdgeInsets.only(top: 14),
                      //color: Colors.blueGrey,
                      width: 200,
                      height: 160,
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '''Iam sojod talaat,computer 
systems engineer at Al-Azhar University, at the fourth level, and a flutter  developer. ''',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )),
                  Text(
                    'My Skills:',
                    style: GoogleFonts.lobster(fontSize: 18),
                  ),
                  Skills(
                    skill: 'Dart',
                    percentage: 95,
                  ),
                  Skills(
                    skill: 'Flutte',
                    percentage: 90,
                  ),
                  Skills(
                    skill: 'Java',
                    percentage: 80,
                  ),
                  // Skills(
                  //   skill: 'Html',
                  //   percentage: 85,
                  // ),
                  // Skills(
                  //   skill: 'Css',
                  //   percentage: 85,
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      'My Certificates:',
                      style: GoogleFonts.lobster(fontSize: 18),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Java coruse'),
                            Text(
                              '120 hours',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                        height: 10,
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Couese()));
                        },
                        child: const Text(
                          'see more..',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      )
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.arrow_forward_ios,
                      //       size: 18,
                      //       color: Color.fromARGB(255, 59, 94, 60),
                      //     ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      'My Work:',
                      style: GoogleFonts.lobster(fontSize: 18),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('bmi app'),
                            Text(
                              '120 hours',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 54,
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Work()));
                        },
                        child: const Text(
                          'see more..',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      )
                      // Row(
                      //   children: [
                      //     Text('more'),
                      //     IconButton(
                      //         onPressed: () {},
                      //         icon: const Icon(
                      //           Icons.arrow_forward_ios,
                      //           size: 18,
                      //           color: Color.fromARGB(255, 59, 94, 60),
                      //         )),
                      //   ],
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
