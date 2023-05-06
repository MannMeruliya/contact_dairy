import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stepper/method.dart';
import 'package:url_launcher/url_launcher.dart';

class detailpage extends StatefulWidget {
  const detailpage({Key? key}) : super(key: key);

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  Widget build(BuildContext context) {
    Contact data = ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: Text("Deatil Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 4,
                ),
                CircleAvatar(
                  radius: 70,
                  foregroundImage: (data.image != null)
                      ? FileImage(File(data.image as String))
                      : null,
                  child: Text(
                    "${data.firstname![0].toUpperCase()}",
                    style: TextStyle(
                      fontSize: 55,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('editpage');
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ],
                    )
                  ],
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${data.firstname} ${data.lastname}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SelectableText(
              "+91 ${data.phone}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              toolbarOptions: ToolbarOptions(copy: true, selectAll: true),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey,
              thickness: 3,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    Uri phone = Uri(
                      scheme: 'tel',
                      path: data.phone,
                    );
                    await launchUrl(phone);
                  },
                  child: Icon(
                    Icons.call_rounded,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.green,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    Uri email = Uri(
                      scheme: 'mailto',
                      path: data.email,
                    );
                    await launchUrl(email);
                  },
                  child: Icon(
                    Icons.email_rounded,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    Uri sms = Uri(
                      scheme: 'sms',
                      path: data.sms,
                    );
                    await launchUrl(sms);
                  },
                  child: Icon(
                    Icons.sms_rounded,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.lightBlueAccent,
                ),
                FloatingActionButton(
                  onPressed: () async {},
                  child: Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey,
              thickness: 3,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
