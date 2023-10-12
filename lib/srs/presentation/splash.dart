import 'package:flutter/material.dart';
import 'package:for_test/srs/presentation/register_page.dart';

import 'login_page.dart';

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
        child: Image.network(
          'https://lh3.googleusercontent.com/p/AF1QipM-GDDDAwq8CWQCn_VjMk6KaT2aOnm1wxyJVDpv=s680-w680-h510',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
