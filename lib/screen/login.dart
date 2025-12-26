import 'package:flutter/material.dart';
import 'package:project_aa/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 48,
              horizontal: 32,
            ),
            child: Column(
              children: [
                Utils.logo(),
                SizedBox(
                  height: 130,
                ),
                Utils.aaTextfield(
                  controller: name,
                  name: '이메일',
                  hint: 'example@email.com',
                ),
                SizedBox(
                  height: 16,
                ),
                Utils.aaTextfield(
                  name: '비밀번호',
                  hint: '********',
                  controller: password,
                ),
                SizedBox(
                  height: 16,
                ),
                Utils.button(title: '로그인'),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '계정이 없으신가요?',
                      style: TextStyle(
                        color: Color(0xff62748E),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Text(
                      '회원가입',
                      style: TextStyle(
                        color: Color(0xff4A2E1F),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
