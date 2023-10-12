import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:for_test/data/services.dart';
import 'package:for_test/srs/presentation/login_page.dart';
import 'package:for_test/srs/presentation/widgets/input_data.dart';


class VerifyPage extends StatelessWidget {
  VerifyPage({super.key, required this.inputEmail});
  TextEditingController inputVerify = TextEditingController();
  String inputEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://img.freepik.com/free-photo/purple-bokeh-digital-business-background_53876-104055.jpg?w=740&t=st=1696997017~exp=1696997617~hmac=72e3f3b23d6feb1cfa15e1775813bab34204b4a8ce27728386bd7e4bb196f2b0',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 250,
            left: 20,
            right: 20,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>LoginPage()));
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
        ],
      ),
    );
  }
}
