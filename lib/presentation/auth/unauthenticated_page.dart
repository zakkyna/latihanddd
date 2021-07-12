import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihanddd/domain/core/theme.dart';
import 'package:latihanddd/presentation/core/widgets/widgets.dart';

import 'unauthenticated.dart';

class UnauthenticatedPage extends StatelessWidget {
  const UnauthenticatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          children: [
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * .1,
            ),
            BaseButton(
                text: 'Log in',
                color: Colors.black,
                fontColor: yellowButtonColor,
                margin: EdgeInsets.zero,
                onPressed: () {
                  Get.to(LoginPage());
                }),
            const SizedBox(
              height: 20,
            ),
            BaseButton(
              text: 'Register',
              color: Colors.grey,
              margin: EdgeInsets.zero,
              onPressed: () {
                Get.to(RegisterPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
