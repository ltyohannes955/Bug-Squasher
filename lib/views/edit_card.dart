import 'package:digital_business_card/bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../database/service.dart';
import 'constant/colors.dart';

class edit_card extends StatefulWidget {
  const edit_card({super.key});

  @override
  State<edit_card> createState() => _edit_cardState();
}

class _edit_cardState extends State<edit_card> {


  @override
  void initstate() {
    super.initState();
    setState(() {});
  }

  
  
  final _service = Services();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back, color: blue, size: MediaQuery.of(context).size.width*.045,),),
                )
                
                
              ],
            ),

            Text('EDIT PROFILE', style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: MediaQuery.of(context).size.width*.075),),

            BlocBuilder<ActivityBloc, ActivityState>
            (builder: (context, state){
              if(state is ActivityInitial){
                BlocProvider.of<ActivityBloc>(context)
                 .add(const GetActivity());

                 return Container();
              }
              if (state is ActivityLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if (state is ActivityLoaded){
                return Container(
                  height: MediaQuery.of(context).size.height*.8,
                  width: MediaQuery.of(context).size.width*.9,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.card.length,
                    itemBuilder: (BuildContext context, int Index){
                      final val = state.card[Index];
                      String _val = val.workArea;
                      final _FullController = TextEditingController(text: val.FullName);
                      final _emailcontroller = TextEditingController(text: val.email);
                      final _phoneNOAreaController = TextEditingController(text: val.phoneNO.toString());
                      final _jobcontroller = TextEditingController(text: val.jobType);
                      final _companycontroller = TextEditingController(text: val.company);
                      return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                // initialValue: val.FullName,
                                controller: _FullController,
                                decoration: const InputDecoration(
                                  labelText: "Full Name",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                child: Text('Work Area', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                              ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: blue,
                                      title: const Text('Enggineering'),
                                        value: 'Enggineering', 
                                        groupValue: _val,
                                        onChanged: (value){
                                          setState(() {
                                            _val = value!;
                                          });
                                        }
                                      ),
                                ),
                                    Expanded(
                                      child: RadioListTile(
                                        activeColor: blue,
                                        title: const Text('Economics'),
                                          value: 'Economics', 
                                          groupValue: _val,
                                          onChanged: (value){
                                      setState(() {
                                        _val = value!;
                                      });
                                      }
                                    ),
                                    ),
                                
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: blue,
                                      title: const Text('tech'),
                                        value: 'tech', 
                                        groupValue: _val,
                                        onChanged: (value){
                                          setState(() {
                                            _val = value!;
                                          });
                                          //selected value
                                        }
                                      ),
                                ),
                                    Expanded(
                                      child: RadioListTile(
                                        activeColor: blue,
                                        title: const Text('Medicaine'),
                                          value: 'Medicaine', 
                                          groupValue: _val,
                                          onChanged: (value){
                                      setState(() {
                                        _val = value!;
                                      });
                                      //selected value
                                      }
                                      ),
                                    ),
                                
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: blue,
                                      title: const Text('Psychology'),
                                        value: 'Psychology', 
                                        groupValue: _val,
                                        onChanged: (value){
                                          setState(() {
                                            _val = value!;
                                          });
                                          //selected value
                                        }
                                      ),
                                ),
                                    Expanded(
                                      child: RadioListTile(
                                        activeColor: blue,
                                        title: const Text('Law'),
                                          value: 'Law', 
                                          groupValue: _val,
                                          onChanged: (value){
                                      setState(() {
                                        _val = value!;
                                      });
                                    }
                                  ),
                                    ),
                                
                              ],
                            ),

                              TextFormField(
                                // initialValue: val.email,
                                controller: _emailcontroller,
                                decoration: const InputDecoration(
                                  labelText: "Email",
                                ),
                              ),

                              TextFormField(
                                // initialValue: val.phoneNO.toString(),
                                controller: _phoneNOAreaController,
                                decoration: const InputDecoration(
                                  labelText: "Phone NO",
                                ),
                              ),
                              TextFormField(
                                // initialValue: val.jobType,
                                controller: _jobcontroller,
                                decoration: const InputDecoration(
                                  labelText: "Jobe Type",
                                ),
                              ),
                              TextFormField(
                                // initialValue: val.company,
                                controller: _companycontroller,
                                decoration: const InputDecoration(
                                  labelText: "Company",
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 20,left: 280),
                                  child: ElevatedButton(onPressed: (){
                                    Navigator.pushNamed(context, '/profile');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: blue,
                                    
                                  ), 
                                  child: Text("Submit", style: TextStyle(fontSize: MediaQuery.of(context).size.width*.035),)),
                                ),
                              
                          ],)
            );
                    }),
                );
                
              }
              return Container();
            }),

            
          ],
        ),
      ),
    );
  }
}