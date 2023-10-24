import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:for_test/data/services.dart';
import 'package:for_test/srs/presentation/widgets/input_data.dart';
import 'package:for_test/srs/presentation/widgets/verify_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController inputLogin = TextEditingController();
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputName = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const Text(
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  InputData(
                    inputName: inputName,
                    labelText: 'Name',
                  ),
                  const SizedBox(height: 16),
                  InputData(
                    inputName: inputLogin,
                    labelText: 'Enter your login',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputData(
                    inputName: inputEmail,
                    labelText: 'Enter your Email',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputData(
                    inputName: inputPassword,
                    labelText: 'Enter your Password',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (inputEmail.text.isEmpty ||
                          inputLogin.text.isEmpty ||
                          inputName.text.isEmpty ||
                          inputPassword.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "Malumotlarni to'ldiring",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        final a = await Services.register(
                          RegisterUser(
                            name: inputName.text,
                            login: inputLogin.text,
                            password: inputPassword.text,
                            email: inputEmail.text,
                          ),
                        );
                        if (a == null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyPage(
                                inputEmail: inputEmail.text,
                              ),
                            ),
                          );
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
