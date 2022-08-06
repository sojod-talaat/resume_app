import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:task_management/data/model.dart';
import 'package:task_management/provider/provider.dart';

class Couese extends StatelessWidget {
  const Couese({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(builder: ((context, provider, c) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text('My Courses',
                    style: GoogleFonts.fingerPaint(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: ListView.builder(
                  itemCount: provider.allTasks.length,
                  itemBuilder: ((context, index) =>
                      buildCardcourse(experince: provider.allTasks[index])))));
    }));
  }
}

// ignore: camel_case_types, must_be_immutable
class buildCardcourse extends StatelessWidget {
  Experince experince;
  buildCardcourse({required this.experince, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(builder: (context, provider, x) {
      return Container(
          width: 100,
          height: 100,
          margin:
              const EdgeInsets.only(left: 10, right: 20, top: 25, bottom: 20),
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 161, 152, 151),
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
              color: Color.fromARGB(255, 59, 94, 60),
              borderRadius: BorderRadius.circular(20)),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: _CircularPercentIndicatorWidget(experince),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        experince.title ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        " from ${experince.startDate} to ${experince.endDate}. ",
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('${experince.numberofhoure!} Houres',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15))
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      provider.deleteTask(experince);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ))
              ],
            ),
          ]));
    });
  }
}

class _CircularPercentIndicatorWidget extends StatelessWidget {
  Experince experince;
  _CircularPercentIndicatorWidget(this.experince);
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 30.0,
      lineWidth: 3.0,
      percent: 80 / 100,
      center: Text(
        experince.progress!,
        style: TextStyle(color: Colors.white),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.grey,
      maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
      linearGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.green, Colors.white, Colors.yellowAccent],
      ),
    );
  }
}
