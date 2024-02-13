import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: pro.otpController,
              decoration: InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
              ),
              onChanged: (otp) {},
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                pro.verifyOtp(pro.otpController.text);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
              ),
              child: Text(
                "Verify OTP",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
