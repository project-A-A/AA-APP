import 'package:flutter/material.dart';
import 'package:project_aa/screen/profile_setting/profile_info.dart';
import 'package:project_aa/utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  bool termsAgreed = false;
  bool privacyAgreed = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Color(0xff2D1810)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          '회원가입',
          style: TextStyle(
            fontFamily: 'Noto Sans KR',
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Color(0xff2D1810),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16),
                  Image.asset('assets/image/aa_logo.png', height: 90),
                  SizedBox(height: 10),
                  Text(
                    '커피 한 잔의 여유로운 대화',
                    style: TextStyle(
                      color: Color(0xff62748E),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 36),
                  Utils.aaTextfield(
                    name: '이름',
                    hint: '홍길동',
                    controller: nameController,
                  ),
                  SizedBox(height: 20),
                  Utils.aaTextfield(
                    name: '이메일',
                    hint: 'example@email.com',
                    controller: emailController,
                  ),
                  SizedBox(height: 20),
                  Utils.aaTextfield(
                    name: '비밀번호',
                    hint: '8자 이상 입력해주세요',
                    controller: passwordController,
                  ),
                  SizedBox(height: 20),
                  Utils.aaTextfield(
                    name: '비밀번호 확인',
                    hint: '비밀번호를 다시 입력해주세요',
                    controller: passwordCheckController,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: termsAgreed,
                        onChanged: (val) => setState(() => termsAgreed = val!),
                        activeColor: Color(0xff4A2E1F),
                      ),
                      const Text('[필수] 서비스 이용약관에 동의합니다'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: privacyAgreed,
                        onChanged: (val) =>
                            setState(() => privacyAgreed = val!),
                        activeColor: Color(0xff4A2E1F),
                      ),
                      const Text('[필수] 개인정보 처리방침에 동의합니다'),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    // onTap: (termsAgreed && privacyAgreed)
                    //     ? () {
                    //         if (_formKey.currentState!.validate()) {
                    //           // TODO: 실제 회원가입 로직 작성
                    //         }
                    //       }
                    //     : null,
                    onTap: () {;
                    },
                    child: Container(
                      width: 329,
                      height: 56,
                      decoration: BoxDecoration(
                        color: (termsAgreed && privacyAgreed)
                            ? const Color(0xff4A2E1F)
                            : Color(0xffDDD5D0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '다음',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
