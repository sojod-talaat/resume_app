import 'dart:io';
import 'dart:typed_data';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:task_management/data/persone-model.dart';
import 'package:task_management/pdf.dart';
import 'package:task_management/provider/provider.dart';
import 'package:task_management/share_pre.dart';
import 'package:task_management/sharedUi/resume_widget.dart';
import 'package:task_management/view/pages/add.dart';
import 'package:task_management/view/pages/course.dart';
import 'package:task_management/view/pages/work.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../sharedUi/skills.dart';

class HomePage extends StatefulWidget {
  PersonModel? person;
  String? pathimage;
  HomePage({super.key, this.person});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List? _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(
      builder: (context, value, child) => SafeArea(
        child: Screenshot(
          controller: screenshotController,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () async {
              await _takeScreenshot();
            }),
            //  ignore: prefer_const_literals_to_create_immutables
            bottomNavigationBar: CurvedNavigationBar(
              height: 45,
              onTap: (int index) {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                person: widget.person,
                              )));
                } else if (index == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddWork()));
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
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage:
                              MemoryImage(widget.person!.persomim!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value.personename.text,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                        ),
                      ),
                      Text(
                        value.PersoneField.text,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey),
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
                      ResumeWidget(
                          icon: Icons.done, text: value.personlan.text),
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
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              value.personeinfo.text,
                              style: TextStyle(color: Colors.grey),
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          sharedprefrance.getImage();
                        },
                        child: Text(
                          'My Skills:',
                          style: GoogleFonts.lobster(fontSize: 18),
                        ),
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
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          )
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Work()));
                            },
                            child: const Text(
                              'see more..',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _takeScreenshot() async {
    // final imageFile = await screenshotController.capture();
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List? image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareXFiles([XFile(imagePath.path)]);
      }
    });
    // await screenshotController.capture().then((Uint8List? image) async {
    //   _imageFile = image;
    //   final dir = (await getApplicationDocumentsDirectory());
    //   final imagePath = await File('${dir.path}/assets/images').create();
    //   await imagePath.writeAsBytes(image!);
    //   widget.pathimage = dir.path;
    // });
  }
}
