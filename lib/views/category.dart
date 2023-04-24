import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/views/widget/MyAppbar.dart';
import 'package:digital_business_card/views/widget/MyDrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/catagory_bloc.dart';
import '../bloc/explor_bloc.dart';
import '../model/cat_List.dart';

import 'package:flutter_locales/flutter_locales.dart';


class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: true,
      left: true,
      child: Scaffold(

        appBar: MyAppbar(),
        body: BlocBuilder<CatagoryBloc, CatagoryState>(
          builder: (context, state) {
            if (state is CatagoryInitial) {
              BlocProvider.of<CatagoryBloc>(context).add(CatagoryEventFetch());
            } else if (state is Catagoryloding) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CatagoryIsucsess) {
              return Column(children: [
                Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 210, 0),
                          child: Container(
                            child: LocaleText(
                              'catagory',
                              style: TextStyle(
                                  fontSize: 20.08,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 60,
                  child: GridView.builder(
                      itemCount: state.catagory_list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              // maxCrossAxisExtent: 200,
                              crossAxisCount: 2,
                              childAspectRatio: 1.5 / 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                      itemBuilder: (BuildContext ctx, index) {
                        cat_list catagory = state.catagory_list[index];
                        return Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<ExplorBloc>(context).add(
                                  ExplorerEventFetch(
                                      catagory: catagory.JobTitle));
                              Navigator.pushNamed(context, '/Explor_page');
                            },
                            child: Container(
                              height: 400,
                              width: 137.11,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black54, BlendMode.darken),
                                      image: NetworkImage(catagory.Image),
                                      fit: BoxFit.cover),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 179, 173, 173),
                                      blurRadius: 17.0,
                                      spreadRadius: 5,
                                      offset: Offset(3, 3),
                                    ),
                                  ],
                                  color: Color.fromARGB(255, 124, 124, 122),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                catagory.JobTitle,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        );
                      }),


                ),
              ]);
            }
            return Container();
          },
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
