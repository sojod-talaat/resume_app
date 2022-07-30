import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Skills extends StatelessWidget {
  String skill;
  int percentage;

  Skills({required this.skill, required this.percentage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.circle_rounded,
                  color: Colors.blueGrey, size: 14),
              const SizedBox(
                width: 12,
              ),
              Text(skill)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 12.0),
          child: StepProgressIndicator(
            totalSteps: 100,
            currentStep: percentage,
            size: 10,
            padding: 0,
            roundedEdges: const Radius.circular(5),
            selectedGradientColor: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 190, 190, 73),
                Color.fromARGB(195, 76, 185, 76)
              ],
            ),
            unselectedGradientColor: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 5, 77, 15),
                Color.fromARGB(255, 163, 163, 13)
              ],
            ),
          ),
        )
      ],
    );
  }
}
