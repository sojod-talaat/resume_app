import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LogInWidget extends StatelessWidget {
  Widget? child;
  Function? function;
  LogInWidget(this.child, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: child
          //decoration: BoxDecoration(image: DecorationImage(image: A)),
          ),
    );
  }
}
