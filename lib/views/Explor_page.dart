import 'package:digital_business_card/bloc/explor_bloc.dart';
import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/views/widget/MyAppbar.dart';
import 'package:digital_business_card/views/widget/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/explor_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Explor_page extends StatelessWidget {
  const Explor_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: BlocBuilder<ExplorBloc, ExplorState>(
        builder: (context, state) {
          if (state is ExplorInitial) {
            BlocProvider.of<ExplorBloc>(context).add(ExplorEventFetch());
          } else if (state is Explorloding) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExplorIsucsess) {
            return ListView.builder(
              itemCount: state.explor_list.length,
              itemBuilder: (BuildContext context, index) {
                final explor = state.explor_list[index];
                print(explor);
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 164,
                      width: 343,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          color: Color.fromARGB(255, 199, 193, 193)),
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    image: NetworkImage(explor.image_E),
                                    fit: BoxFit.cover),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(left: 43),
                              child: Container(
                                child: Column(children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                    child: Container(
                                      child: Text(
                                        explor.fullNAME,
                                        selectionColor: Colors.purple,
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                    child: Container(
                                      child: Text(explor.workarea,
                                          selectionColor:
                                              Color.fromARGB(255, 0, 0, 0),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                    child: Container(
                                      child: Text(explor.jobTYPE,
                                          selectionColor:
                                              Color.fromARGB(255, 0, 0, 0),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 13),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            child: IconButton(
                                              onPressed: () => launch(
                                                  'sms:${explor.phonNO}\$'),
                                              icon: Icon(
                                                Icons.message_outlined,
                                                fill: BorderSide
                                                    .strokeAlignCenter,
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            child: IconButton(
                                              onPressed: () => launch(
                                                  "tel:${explor.phonNO}\$"),
                                              icon: const Icon(
                                                Icons.phone,
                                                fill: BorderSide
                                                    .strokeAlignCenter,
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.09,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: const Icon(
                                            Icons.video_call_outlined,
                                            fill: BorderSide.strokeAlignCenter,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                              ))
                        ],
                      )),
                );
              },
            );
          }
          return Container();
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
