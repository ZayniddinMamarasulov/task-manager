import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/icons/ic_burger.svg",
                    color: Theme.of(context).indicatorColor,
                    width: 28,
                    height: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/ic_account_avatar.svg",
                    color: Theme.of(context).indicatorColor,
                    width: 30,
                    height: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Hello Rohan!",
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyText1),
            ),
            Text(
              "Have a nice day.",
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyText2),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          ],
        ),
      ),
    );
  }
}
