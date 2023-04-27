import 'package:digital_business_card/widget/MyBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'constant/colors.dart';

class edit_card extends StatefulWidget {
  const edit_card({super.key});

  @override
  State<edit_card> createState() => _edit_cardState();
}

class _edit_cardState extends State<edit_card> {
  int _val = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: blue,
                      size: MediaQuery.of(context).size.width * .045,
                    ),
                  ),
                )
              ],
            ),
            Text(
              'EDIT PROFILE',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blue,
                  fontSize: MediaQuery.of(context).size.width * .075),
            ),
            Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .8,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        'Work Area',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * .035),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: RadioListTile(
                              activeColor: blue,
                              title: Text('Enggineering'),
                              value: 1,
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              activeColor: blue,
                              title: Text('Economics'),
                              value: 2,
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                              }),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: RadioListTile(
                              activeColor: blue,
                              title: Text('tech'),
                              value: 3,
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                                //selected value
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              activeColor: blue,
                              title: Text('Medicaine'),
                              value: 4,
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                                //selected value
                              }),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: RadioListTile(
                              activeColor: blue,
                              title: Text('Psychology'),
                              value: 5,
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                                //selected value
                              }),
                        ),
                        Expanded(
                          child: RadioListTile(
                              activeColor: blue,
                              title: Text('Law'),
                              value: 6,
                              groupValue: _val,
                              onChanged: (value) {
                                setState(() {
                                  _val = value!;
                                });
                              }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        'Email:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * .035),
                      ),
                    ),
                    TextFormField(
                      initialValue: 'test@gmail.com',
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        'Phone NO:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * .035),
                      ),
                    ),
                    TextFormField(
                      initialValue: '0912345678',
                      decoration: InputDecoration(
                        labelText: "Phone NO",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        'Job Type:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * .035),
                      ),
                    ),
                    TextFormField(
                      initialValue: 'CEO',
                      decoration: InputDecoration(
                        labelText: "Jobe Type",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        'Company:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * .035),
                      ),
                    ),
                    TextFormField(
                      initialValue: 'ABC .PLC',
                      decoration: InputDecoration(
                        labelText: "Company",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: blue,
                            ),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .035),
                            )),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
