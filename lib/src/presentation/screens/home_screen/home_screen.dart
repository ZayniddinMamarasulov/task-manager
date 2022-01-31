import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/src/presentation/cubit/task_type_cubit.dart';
import 'package:task_manager/src/presentation/cubit/task_type_items.dart';
import 'package:task_manager/src/presentation/cubit/task_type_state.dart';
import 'package:task_manager/src/presentation/theme/app_theme.dart';

import 'widgets/column_text.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/task_type_list.dart';

class HomeScree extends StatefulWidget {
  HomeScree({Key? key}) : super(key: key);

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            columnText(context, "Hello Rohan!", "Have a nice day."),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            TaskTypeList(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context)
                                .primaryColorLight
                                .withOpacity(0.8),
                            i == 0
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.4),
                          ],
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                10.0) //                 <--- border radius here
                            ),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage("assets/icons/cart_image.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                            10.0) //                 <--- border radius here
                                        ),
                                    color: Theme.of(context)
                                        .primaryColorLight
                                        .withOpacity(0.5),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/icons/ic_project-management.svg",
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Project 1",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text("Front-End Develpment",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                )),
                            Text("October, 20,2020",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
