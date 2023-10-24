import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:for_test/data/services.dart';
import 'package:for_test/srs/presentation/widgets/input_data.dart';

import 'login_page.dart';

class VerifyPage extends StatelessWidget {
  VerifyPage({super.key, required this.inputEmail});
  TextEditingController inputVerify = TextEditingController();
  String inputEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/v1016-c-08_1-ksh6mza3.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 160,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verify',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              InputData(
                inputName: inputVerify,
                labelText: 'Verify SMS',
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () async {
                  final a = await Services.verify(
                      email: inputEmail, code: inputVerify.text);
                  if (a == null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else if (a.isSuccess == false) {
                    Fluttertoast.showToast(
                      msg: a.messages,
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
