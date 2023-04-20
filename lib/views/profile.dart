import 'package:digital_business_card/database/service.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activity_bloc.dart';
import 'constant/colors.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initstate() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _service = Services();
    return SafeArea(
      child: Scaffold(
        backgroundColor: '#2B5B80'.toColor(),
        body:Column(
          children: [
            Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width * .045,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.red,
                              )),
                        )
                      ],
                    ),
                    Center(
                    child: Text(
                  'Business cards',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * .055),
                )),
                BlocBuilder<ActivityBloc, ActivityState>(
          builder: (context, state) {
            if(state is ActivityInitial){
              BlocProvider.of<ActivityBloc>(context)
                .add(GetActivity());

                return Container();
              
            }
            if (state is ActivityLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if (state is ActivityLoaded){
              if (state.card.isEmpty){
                return Center(
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, '/setup');
                  }, child: Text('Add Card')),
                );
              }
              return 
              Container(
                child: Card(
                       elevation: 20,
                       child: Container(
                         decoration:
                             BoxDecoration(borderRadius: BorderRadius.circular(20)),
                         height: MediaQuery.of(context).size.height * .3,
                         width: MediaQuery.of(context).size.width * .9,
                         child: Row(
                           children: [
                             Column(
                               children: [
                                 Icon(
                                   Icons.person,
                                   size: MediaQuery.of(context).size.height * .15,
                                 ),
                               ],
                             ),
                             Column(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   state.card[0].FullName,
                                   style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       fontSize:
                                           MediaQuery.of(context).size.width * .055),
                                 ),
                                 RichText(
                                     text: TextSpan(
                                         text: 'Work Area: ',
                                         style: const TextStyle(
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black),
                                         children: <TextSpan>[
                                       TextSpan(
                                           text: state.card[0].workArea,
                                           style: TextStyle(color: Colors.grey))
                                     ])),
                                 RichText(
                                     text: TextSpan(
                                         text: 'Email: ',
                                         style: const TextStyle(
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black),
                                         children: <TextSpan>[
                                       TextSpan(
                                           text: state.card[0].email,
                                           style: TextStyle(color: Colors.grey))
                                     ])),
                                 RichText(
                                     text: TextSpan(
                                         text: 'Phone NO: ',
                                         style: const TextStyle(
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black),
                                         children: <TextSpan>[
                                       TextSpan(
                                           text: state.card[0].phoneNO.toString(),
                                           style: TextStyle(color: Colors.grey))
                                     ])),
                                 RichText(
                                     text: TextSpan(
                                         text: 'Job Type: ',
                                         style: const TextStyle(
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black),
                                         children: <TextSpan>[
                                       TextSpan(
                                           text: state.card[0].jobType,
                                           style: TextStyle(color: Colors.grey))
                                     ])),
                                 RichText(
                                     text: TextSpan(
                                         text: 'company: ',
                                         style: const TextStyle(
                                             fontWeight: FontWeight.bold,
                                             color: Colors.black),
                                         children: <TextSpan>[
                                       TextSpan(
                                           text: state.card[0].company,
                                           style: TextStyle(color: Colors.grey))
                                     ])),
                                 ElevatedButton(
                                     onPressed: () {
                                       Navigator.pushNamed(context, "/edit_card");
                                     },
                                     style: ElevatedButton.styleFrom(
                                       primary: blue,
                                     ),
                                     child: Text(
                                       "EDIT",
                                       style: TextStyle(
                                           fontSize:
                                               MediaQuery.of(context).size.width *
                                                   .04),
                                     )),
                               ],
                             ),
                           ],
                         ),
                       ),
                     )
                  ,

                // child: ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: state.card.length,
                //   itemBuilder: (BuildContext context, int index){
                //     final state.card[0] = state.card[index];
                //      return 
                //   }),
              );
            }
            return Container();  
          },
          
        ),
          ],
        ),
                
         
        floatingActionButton: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '');
            },
            icon: Icon(
              Icons.qr_code,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * .1,
            )),
      ),
    );
  }
}
