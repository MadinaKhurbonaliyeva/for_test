import 'package:flutter/material.dart';
import 'package:for_test/srs/presentation/widgets/register_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {

    goToNextPage();
    super.initState();
  }

  void goToNextPage() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Image.asset(
'assets/image/v1016-c-08_1-ksh6mza3.jpeg',          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
