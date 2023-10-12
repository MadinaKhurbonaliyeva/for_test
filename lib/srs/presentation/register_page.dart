import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:for_test/data/services.dart';
import 'package:for_test/srs/presentation/verify_page.dart';
import 'package:for_test/srs/presentation/widgets/input_data.dart';

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
            padding: EdgeInsets.only(
              top: 154,
              left: 110,
            ),
            child: Text(
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
          ),
          Positioned(
            top: 250,
            left: 20,
            right: 20,
            child: Column(
              children: [
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
                  ],
                ),
                Positioned(
                  bottom: 95,
                  left: 10,
                  right: 10,
                  child: GestureDetector(
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
                                      )));
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
