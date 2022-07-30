import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_management/view/ogenerateRouaters/responsve.dart';

import '../sharedUi/textfield.dart';

class AddTask extends StatelessWidget {
  //const AddTask({Key? key}) : super(key: key);
  TextEditingController task = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColore.fromHex('446129'),
      body: Column(children: [
        SizedBox(
          height: 8.0.wp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            const Text(
              'Create New Task',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.abc,
                  color: Colors.white,
                )),
          ],
        ),
        Container(
          width: double.maxFinite,
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0.wp),
                  child: Text(
                    'Information',
                    style: TextStyle(
                        color: HexColore.fromHex('2E3E5C'),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfield(
                    controller: task,
                    textfieldlabel: 'Task',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Textfield(
                    controller: task,
                    textfieldlabel: 'TaskTitle',
                  ),
                ),
                SizedBox(
                  height: 8.0.wp,
                ),
                Center(child: Image.asset('assets/images/Group 3.png'))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
