import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:task_management/data/model.dart';
import 'package:task_management/data/workmodel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/provider.dart';

import 'add.dart';
import 'home.dart';

class Work extends StatelessWidget {
  Work({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Experince experince;
    return Consumer<DbProvider>(builder: (context, provider, x) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text('My Work',
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
              bottomNavigationBar: CurvedNavigationBar(
                height: 45,
                index: 2,
                onTap: (int index) {
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else if (index == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddWork()));
                  } else if (index == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Work()));
                  }
                },
                backgroundColor: const Color.fromARGB(255, 59, 94, 60),
                //backgroundColor: Color.fromARGB(255, 34, 119, 37),
                items: const [
                  Icon(Icons.home),
                  Icon(Icons.add),
                  Icon(Icons.work)
                ],
              ),
              body: ListView.builder(
                  itemCount: provider.allwork.length,
                  itemBuilder: ((context, index) => makeItem(
                        work: provider.allwork[index],
                      )))));
    } // ),
        );
  }
}

class makeItem extends StatelessWidget {
  WorkModel work;
  makeItem({required this.work});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
// ignore: deprecated_member_use
        launch(work.url!);
      },
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 180,
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.circle_outlined,
                color: Color.fromARGB(255, 59, 94, 60),
              ),
            ),
            Expanded(
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: MemoryImage(work.picture!), fit: BoxFit.cover)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.1),
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        work.title!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            work.date!,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





















// GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: 
//                 _listItem
//                     .map((item) => Card(
//                           color: Colors.transparent,
//                           elevation: 0,
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: DecorationImage(
//                                     image: AssetImage(item),
//                                     fit: BoxFit.cover)),
//                             child: Transform.translate(
//                               offset: Offset(50, -50),
//                               child: Container(
//                                 margin: EdgeInsets.symmetric(
//                                     horizontal: 65, vertical: 63),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Colors.white),
//                                 child: Icon(
//                                   Icons.bookmark_border,
//                                   size: 15,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ))
//                     .toList(),
//               )));