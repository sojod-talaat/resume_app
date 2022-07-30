import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../ogenerateRouaters/responsve.dart';
import 'add.dart';
import 'home.dart';

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          height: 50,
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
              //  navigator!.pushNamed(AppRoute.homePage);
            } else if (index == 1) {
              // navigator?.pushNamed(AppRoute.AddworkPage);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddWork()));
            } else if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Work()));
            }
          },
          backgroundColor: HexColore.fromHex('446129'),
          //backgroundColor: Color.fromARGB(255, 34, 119, 37),
          items: const [
            Icon(Icons.home),
            Icon(Icons.add),
            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
