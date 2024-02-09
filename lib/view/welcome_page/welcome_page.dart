import 'package:authentication/theme/app_color.dart';
import 'package:authentication/view/home_page/home_page.dart';
import 'package:authentication/view/login_page/login.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';

AppColors appcolor = AppColors();

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: size.height * 0.4,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color.fromARGB(255, 253, 177, 63),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.1),
                          TextWidget().text(
                              data: 'Discover a World of',
                              color: appcolor.white,
                              size: 28.0,
                              weight: FontWeight.bold),
                          TextWidget().text(
                              data: 'Books',
                              color: appcolor.white,
                              size: 28.0,
                              weight: FontWeight.bold),
                          const SizedBox(height: 20),
                          TextWidget().text(
                              data:
                                  'Explore, Read, and Immerse Yourself in Endless Stories',
                              color: appcolor.white,
                              size: 16.0,
                              align: TextAlign.center),
                          const SizedBox(height: 35),
                          SizedBox(
                            height: size.height * .05,
                            width: size.width * .5,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () {
                                // checkUserLoggedIn(context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: TextWidget().text(
                                data: 'Get Started',
                                color: appcolor.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  // checkUserLoggedIn(context) async {
  //   final sharedPrfs = await SharedPreferences.getInstance();
  //   final userLoggedIn = sharedPrfs.getBool('savekey');
  //   if (userLoggedIn == null || userLoggedIn == false) {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const LoginScreen(),
  //         ));
  //   } else {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (context) => const BottomBar(),
  //     ));
  //   }
  // }
}
