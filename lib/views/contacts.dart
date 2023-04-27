import 'package:digital_business_card/model/model.dart';
import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/widget/MyBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constant/text.dart';
import 'package:digital_business_card/bloc/popular_bloc.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#2B5B80'.toColor(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 25,
        foregroundColor: Colors.white,
        title: const Text("Digital Business Card"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(Icons.account_circle_outlined))
        ],
      ),
      body: BlocBuilder<PopularBloc, PopularState>(
        builder: (context, state) {
          if (state is PopularInitial) {
            BlocProvider.of<PopularBloc>(context).add(PopularEventFetch());
          } else if (state is PopularLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PopularSuccess) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "DBC",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
                Card(
                  elevation: 25,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(1))),
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/tyss.jpg",
                              fit: BoxFit.cover,
                              height: 200,
                              width: 130,
                            ),
                            const Spacer(
                              flex: 15,
                            ),
                            a
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 95, 92, 92),
                              blurRadius: 0,
                              spreadRadius: 2,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: IconButton(
                        icon: const Icon(Icons.lightbulb_circle),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, '/catagorys');
                          });
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.thumb_up,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Icon(
                        Icons.share,
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.manage_accounts_sharp)),
                  ],
                ),
                Row(
                  children: const [b, c, d, e],
                ),
                const Text(
                  "Popular",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
                Container(
                  height: 200.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.Popular_items.length,
                      itemBuilder: (BuildContext context, index) {
                        Model popular = state.Popular_items[index];
                        return Column(
                          children: [
                            Card(
                              elevation: 25,
                              color: '#91ABC2'.toColor(),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(popular.Image),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.199,
                              ),
                            ),
                            Container(
                              child: Text(
                                "${popular.Name}\$",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                            )
                          ],
                        );
                      }),
                )
              ],
            ));
          }
          return Container();
        },
      ),
      bottomNavigationBar: const MyBottomNav(),
    );
  }
}
