import 'package:flutter/material.dart';

import 'package:task_management/view/ogenerateRouaters/responsve.dart';

import 'package:task_management/view/pages/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/Group 1649.png'))),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/Group 1650.png'),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                ''' Work with the team and improve your team
    
               performance with ease and fun''',
                style: TextStyle(
                    letterSpacing: 0.5,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 70),
              // Image.asset('assets/images/Group 6.png'),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Container(
                    width: 327,
                    height: 56,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 209, 190, 188),
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                      color: const Color.fromARGB(255, 59, 94, 60),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            )),
                        SizedBox(width: 80),
                        Text(
                          'Get Started ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
