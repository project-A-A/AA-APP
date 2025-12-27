import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static Column logo() {
    return Column(
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
    );
  }

  static SizedBox aaTextfield({
    required String name,
    required String hint,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: 329,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE2E8F0), width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE2E8F0), width: 2),
                borderRadius: BorderRadius.circular(16),
              ),

              hintText: hint,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff0A0A0A).withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Container button({required String title}) {
    return Container(
      width: 329,
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xff4A2E1F),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
