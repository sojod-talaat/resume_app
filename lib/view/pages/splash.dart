import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task_management/data/persone-model.dart';
import 'package:task_management/provider/provider.dart';

import 'package:task_management/view/pages/home.dart';

import '../../color.dart';
import '../../sharedUi/textfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File? selectedImage;
    Uint8List? imagePath;
    return Consumer<DbProvider>(
      builder: (context, provider, child) => SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                  Text('Resume create')
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    top: 6, left: 11, right: 11, bottom: 10),
                padding: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: HexColore.fromHex('446129')),
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                ),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Welcome to Resume App, add your details',
                      style: TextStyle(
                          color: HexColore.fromHex('2E3E5C'),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textfield(
                      title: 'persone name',
                      controller: provider.personename,
                      textfieldlabel: 'Youre Name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textfield(
                      title: ' Field',
                      controller: provider.PersoneField,
                      textfieldlabel: 'Youre Field',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: Textfield(
                        title: 'About me',
                        controller: provider.personeinfo,
                        textfieldlabel: 'About Me',
                        contentpadding: 29,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textfield(
                      title: ' prfended Langues',
                      controller: provider.personlan,
                      textfieldlabel: 'Talented Langue',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textfield(
                      controller: provider.personImage,
                      textfieldlabel: 'Upload Your image',
                      suffix: IconButton(
                        icon: const Icon(Icons.upload),
                        onPressed: () async {
                          XFile? file = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          selectedImage = File(file!.path);
                          provider.personImage.text = file.path.split('/').last;
                          imagePath = await file.readAsBytes();
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      PersonModel persone = PersonModel(
                          Name: provider.personename.text,
                          field: provider.PersoneField.text,
                          info: provider.personeinfo.text,
                          persomim: imagePath,
                          personlang: provider.personlan.text);

                      await Provider.of<DbProvider>(context, listen: false)
                          .createNewPerson(persone);
                      await Get.to(() => HomePage(
                            person: persone,
                          ));
                    },
                    child:
                        Center(child: Image.asset('assets/images/Group 3.png')),
                  ),
                ]),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
