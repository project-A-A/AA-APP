import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/aa_logo.png'),
            SizedBox(height: 16),
            Text(
              '아.아.',
              style: TextStyle(
                color: Color(0xff2D1810),
                fontWeight: FontWeight.w900,
                fontSize: 35,
              ),
            ),
            SizedBox(height: 12),
            Text(
              '커피 한 잔의 여유로운 대화',
              style: TextStyle(
                color: Color(0xff62748E),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
