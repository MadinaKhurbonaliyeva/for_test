import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:for_test/data/services.dart';
import 'package:for_test/srs/presentation/register_page.dart';
import 'package:for_test/srs/presentation/widgets/input_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController inputLogin = TextEditingController();
  TextEditingController inputPassord = TextEditingController();
  bool rememberMe = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a loading delay of 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

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
          const Padding(
            padding: EdgeInsets.only(top: 154, left: 130),
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 20,
            right: 20,
            child: Column(
              children: [
                InputData(inputName: inputLogin, labelText: "Enter login..."),
                const SizedBox(height: 16),
                InputData(
                    inputName: inputPassord, labelText: "Enter your password"),
                const SizedBox(height: 16),
                isLoading
                    ? const CircularProgressIndicator() // Show the loading indicator
                    : Switch(
                        value: rememberMe,
                        onChanged: (newValue) {
                          setState(() {
                            rememberMe =
                                newValue; // Update the state of the switch
                          });
                        },
                      ),
                Container(
                  color: rememberMe ? Colors.green : Colors.transparent,
                  child: const Text(
                    'Remember Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 95,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () async {
                if (inputLogin.text.isEmpty || inputPassord.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: "Malumotlarni to'ldiring",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  final a = await Services.loginUser(
                    login: inputLogin.text,
                    password: inputPassord.text,
                  );
                  print(a);
                  if (a == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scaffold(
                                    body: Center(
                                  child: Text('Login boldi'),
                                ))));
                  } else if (a.isSuccess == false) {
                    Fluttertoast.showToast(
                      msg: "${a.messages}",
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                }
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
