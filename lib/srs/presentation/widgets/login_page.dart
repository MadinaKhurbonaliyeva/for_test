import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:for_test/data/services.dart';
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
                height: 120,
              ),
              const Text(
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
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  InputData(inputName: inputLogin, labelText: "Enter login..."),
                  const SizedBox(height: 16),
                  InputData(
                      inputName: inputPassord,
                      labelText: "Enter your password"),
                  const SizedBox(height: 16),
                ],
              ),
              GestureDetector(
                onTap: () async {
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
        ),
      ),
    );
  }
}
