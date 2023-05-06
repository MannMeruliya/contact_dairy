import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stepper/global.dart';
import 'package:stepper/method.dart';

class contactpage extends StatefulWidget {
  const contactpage({Key? key}) : super(key: key);

  @override
  State<contactpage> createState() => _contactpageState();
}

final GlobalKey<FormState> contactkey = GlobalKey<FormState>();

final TextEditingController firstnamecontroller = TextEditingController();
final TextEditingController lastnamecontroller = TextEditingController();
final TextEditingController phonecontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();

String? firstname;
String? lastname;
String? phone;
String? email;

class _contactpageState extends State<contactpage> {
  @override
  void initState() {
    super.initState();
    firstnamecontroller.text =
        (Global.firstname != null) ? Global.firstname as String : "";
    lastnamecontroller.text =
        (Global.lastname != null) ? Global.lastname as String : "";
    phonecontroller.text = (Global.phone != null) ? Global.phone as String : "";
    emailcontroller.text = (Global.email != null) ? Global.email as String : "";
  }

  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        actions: [
          IconButton(
            onPressed: () {
              if (contactkey.currentState!.validate()) {
                contactkey.currentState!.save();

                Contact con = Contact(
                  firstname: Global.firstname,
                  lastname: Global.lastname,
                  phone: Global.phone,
                  email: Global.email,
                  image: Global.image,
                  sms: Global.sms,
                );
                Global.allcontacts.add(con);
                Navigator.of(context).pop();
              }
            },
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    foregroundImage: (Global.image != null)
                        ? FileImage(File(Global.image as String))
                        : null,
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.add),
                      onPressed: () async {
                        showGeneralDialog(
                            context: context,
                            pageBuilder: (context, _, __) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        ElevatedButton(
                                          child: Text("Camera"),
                                          onPressed: () async {
                                            XFile? image =
                                                await imagePicker.pickImage(
                                                    source: ImageSource.camera);
                                            setState(() {
                                              Global.image = image!.path;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          child: Text("Gallery"),
                                          onPressed: () async {
                                            XFile? image =
                                                await imagePicker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              Global.image = image!.path;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: contactkey,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "First Name",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: firstnamecontroller,
                          validator: (h) {
                            if (h!.isEmpty) {
                              return "Enter first name ...";
                            }
                            return null;
                          },
                          onSaved: (h) {
                            Global.firstname = h;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Enter first name ...',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Last Name",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: lastnamecontroller,
                          validator: (h) {
                            if (h!.isEmpty) {
                              return "Enter last name ...";
                            }
                            return null;
                          },
                          onSaved: (h) {
                            Global.lastname = h;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Enter last name ...',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Phone Number",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: phonecontroller,
                          validator: (h) {
                            if (h!.isEmpty) {
                              return "Enter phone number ...";
                            }
                            return null;
                          },
                          onSaved: (h) {
                            Global.phone = h;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Enter phone number ...',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "Email",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: emailcontroller,
                          validator: (h) {
                            if (h!.isEmpty) {
                              return "Enter first Email ...";
                            }
                            return null;
                          },
                          onSaved: (h) {
                            Global.email = h;
                          },
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: 'Enter first Email ...',
                              border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
