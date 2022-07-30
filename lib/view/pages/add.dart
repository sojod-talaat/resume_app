import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:task_management/view/ogenerateRouaters/responsve.dart';
import 'package:task_management/view/pages/home.dart';
import 'package:task_management/view/pages/work.dart';

import '../../sharedUi/textfield.dart';
import 'dart:io';

// ignore: must_be_immutable
class AddWork extends StatefulWidget {
  //const AddWork({Key? key}) : super(key: key);
  File? selectedImage;
  TextEditingController coursename = TextEditingController();
  TextEditingController numberofhour = TextEditingController();
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate = TextEditingController();
  TextEditingController uploadfile = TextEditingController();
  TextEditingController projecttiltle = TextEditingController();
  TextEditingController completdata = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController uploadimage = TextEditingController();
  TextEditingController url = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  AddWork({Key? key}) : super(key: key);
  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(file!.path);
    //String name = file.path.split("kkcmsd").last();
  }

  @override
  State<AddWork> createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              index: 1,
              height: 45,
              onTap: (int index) {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                  //  navigator!.pushNamed(AppRoute.homePage);
                } else if (index == 1) {
                  // navigator?.pushNamed(AppRoute.AddworkPage);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddWork()));
                } else if (index == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Work()));
                }
              },
              backgroundColor: Color.fromARGB(255, 59, 94, 60),
              items: const [
                Icon(Icons.home),
                Icon(Icons.add),
                Icon(Icons.settings),
              ],
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      'Chosse what you want to Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35)),
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: HexColore.fromHex('446129'),
                        ),
                        controller: tabController,
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 30),
                        tabs: const [
                          Tab(
                            child: Text(
                              'courses',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Work',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: tabController,
                  children: [
                    Form(
                      key: widget.formkey,
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              top: 18, left: 11, right: 11),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: HexColore.fromHex('446129')),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                  35,
                                ),
                                topRight: Radius.circular(
                                  35,
                                ),
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35)),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5.0.wp),
                                child: Text(
                                  'Add New course',
                                  style: TextStyle(
                                      color: HexColore.fromHex('2E3E5C'),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Textfield(
                                  type: TextInputType.name,
                                  controller: widget.coursename,
                                  textfieldlabel: 'Course Name',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Textfield(
                                  type: TextInputType.number,
                                  controller: widget.numberofhour,
                                  textfieldlabel: 'Number of houre',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Textfield(
                                  controller: widget.startdate,
                                  textfieldlabel: 'Start Date',
                                  suffix: IconButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);

                                          setState(() {
                                            widget.startdate.text =
                                                formattedDate;
                                          });
                                        } else {}
                                      },
                                      icon: const Icon(
                                          Icons.date_range_outlined)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Textfield(
                                  controller: widget.enddate,
                                  textfieldlabel: 'End Date',
                                  suffix: IconButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);

                                          setState(() {
                                            widget.enddate.text = formattedDate;
                                          });
                                        } else {}
                                      },
                                      icon: const Icon(
                                          Icons.date_range_outlined)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Textfield(
                                    enable: false,
                                    suffix: IconButton(
                                        onPressed: () {
                                          widget.getImage();
                                        },
                                        icon: Icon(Icons.upload_rounded)),
                                    controller: widget.uploadfile,
                                    textfieldlabel:
                                        'Upload certificate image '),
                              ),
                              SizedBox(
                                height: 10.0.wp,
                              ),
                              InkWell(
                                onTap: () {
                                  /////////////////////
                                  if (widget.formkey.currentState!
                                      .validate()) {}
                                },
                                child: Center(
                                    child: Image.asset(
                                        'assets/images/Group 3.png')),
                              ),
                              const SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(top: 18, left: 11, right: 11),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: HexColore.fromHex('446129')),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                35,
                              ),
                              topRight: Radius.circular(
                                35,
                              ),
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0.wp),
                              child: Text(
                                'Add New work',
                                style: TextStyle(
                                    color: HexColore.fromHex('2E3E5C'),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Textfield(
                                controller: widget.projecttiltle,
                                textfieldlabel: 'Project title',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Textfield(
                                controller: widget.completdata,
                                textfieldlabel: 'Complation Data',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Textfield(
                                controller: widget.desc,
                                textfieldlabel: ' Descrption',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Textfield(
                                controller: widget.uploadimage,
                                textfieldlabel: 'Upload project image',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Textfield(
                                  controller: widget.url,
                                  textfieldlabel: 'Url project '),
                            ),
                            SizedBox(
                              height: 10.0.wp,
                            ),
                            Center(
                                child:
                                    Image.asset('assets/images/Group 3.png')),
                            const SizedBox(
                              height: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}
