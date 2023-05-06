import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepper/global.dart';
import 'package:stepper/themeprovider.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isGridView = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<Themeprovider>(
      builder: (context, themeNotifier, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            themeNotifier.isDark ? "Contact" : "Contact",
          ),
          actions: [
            IconButton(
              onPressed: () {
                themeNotifier.isDark
                    ? themeNotifier.isDark = false
                    : themeNotifier.isDark = true;
                print("themeNotifier.isDark ${themeNotifier.isDark}");
              },
              icon: Icon(
                themeNotifier.isDark ? Icons.nightlight : Icons.wb_sunny,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isGridView = !isGridView;
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .pushNamed('contactpage')
                .then((value) => setState(() {}));
          },
        ),
        body: Container(
          alignment: Alignment.center,
          child: (Global.allcontacts.isEmpty)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_box_rounded,
                      size: 200,
                    ),
                    Text(
                      "You have no contacts yet",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    )
                  ],
                )
              : (isGridView == false)
                  ? ListView.builder(
                      itemCount: Global.allcontacts.length,
                      itemBuilder: (context, i) {
                        return Card(
                          elevation: 3,
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed('detailpage',
                                  arguments: Global.allcontacts[i]);
                            },
                            leading: CircleAvatar(
                              radius: 30,
                              foregroundImage: (Global.allcontacts[i].image !=
                                      null)
                                  ? FileImage(File(
                                      Global.allcontacts[i].image as String))
                                  : null,
                            ),
                            title: Text(
                                "${Global.allcontacts[i].firstname}  ${Global.allcontacts[i].lastname}"),
                            subtitle:
                                Text("+91 ${Global.allcontacts[i].phone}"),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.phone,
                                color: Colors.green,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        );
                      })
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: 2,
                      ),
                      itemCount: Global.allcontacts.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: Container(
                            height: 200,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  foregroundImage:
                                      (Global.allcontacts[i].image != null)
                                          ? FileImage(File(Global
                                              .allcontacts[i].image as String))
                                          : null,
                                ),
                                Text(
                                    "${Global.allcontacts[i].firstname} , ${Global.allcontacts[i].lastname}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
