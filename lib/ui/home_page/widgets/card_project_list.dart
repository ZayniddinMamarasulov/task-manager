import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProjectList extends StatelessWidget {
  const CardProjectList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 4),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Theme.of(context).primaryColorLight.withOpacity(0.8),
                    i == 0
                        ? Theme.of(context).primaryColorDark
                        : Theme.of(context).primaryColorDark.withOpacity(0.4),
                  ],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
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
    );
  }
}
