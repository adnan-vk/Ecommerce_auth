import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/view/home_page/home_page.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AuthenticationProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: size.height * .3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.twilio.com/content/dam/twilio-com/global/en/blog/legacy/2023/what-does-otp-mean/What_Is_a_One-Time_Password_OTP.png'))),
            ),
            textFormField().textformfield(
                controller: pro.otpController,
                labeltext: "OTP",
                onchange: pro.verifyOtp(pro.otpController.text),
                keytype: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  pro.verifyOtp(pro.otpController.text);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
                child: TextWidget().text(
                    data: 'Verify OTP',
                    size: 18.0,
                    weight: FontWeight.bold,
                    color: appcolor.white)),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
