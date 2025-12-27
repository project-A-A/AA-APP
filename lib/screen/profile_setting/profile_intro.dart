import 'package:flutter/material.dart';

class ProfileIntroScreen extends StatefulWidget {
  const ProfileIntroScreen({super.key});

  @override
  State<ProfileIntroScreen> createState() => _ProfileIntroScreenState();
}

class _ProfileIntroScreenState extends State<ProfileIntroScreen> {
  final TextEditingController introController = TextEditingController();
  final int maxLength = 300;

  @override
  void initState() {
    super.initState();
    introController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Color(0xff2D1810)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          '프로필 설정',
          style: TextStyle(
            fontFamily: 'Noto Sans KR',
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Color(0xff2D1810),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xff4A2E1F),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xff4A2E1F),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xffE2E8F0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '자기소개를 작성해주세요',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2D1810),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '간단한 소개와 커피챗 목적을 알려주세요',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff62748E),
                ),
              ),
              SizedBox(height: 32),
              _buildIntroTextField(),
              SizedBox(height: 24),
              _buildTipsSection(),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  // 다음 단계로 이동하는 로직
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xff4A2E1F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '다음',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Noto Sans KR',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.description,
              size: 18,
              color: Color(0xff62748E),
            ),
            SizedBox(width: 8),
            Text(
              '자기소개',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Noto Sans KR',
                color: Color(0xff2D1810),
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffE2E8F0),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: introController,
            maxLength: maxLength,
            maxLines: 8,
            minLines: 6,
            cursorColor: Color(0xff2D1810),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: '예) 안녕하세요! 스타트업에서 프로덕트 디자이너로 일하고 있습니다. 디자인과 UX에 관심 있는 분들과 커피챗 나누고 싶어요.',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: 'Noto Sans KR',
                color: Color(0xff0A0A0A).withOpacity(0.5),
              ),
              contentPadding: EdgeInsets.all(16),
              counterText: '',
            ),
          ),
        ),
        SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${introController.text.length}/$maxLength',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              fontFamily: 'Noto Sans KR',
              color: Color(0xff62748E),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTipsSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xffFFF8E7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_cafe,
                color: Color(0xff4A2E1F),
                size: 20,
              ),
              SizedBox(width: 8),
              Icon(
                Icons.lightbulb_outline,
                color: Color(0xffFFB800),
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                '좋은 자기소개 팁',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2D1810),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildTipItem('현재 하고 있는 일'),
          SizedBox(height: 8),
          _buildTipItem('관심 분야나 전문성'),
          SizedBox(height: 8),
          _buildTipItem('커피챗을 통해 얻고 싶은 것'),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6, right: 8),
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: Color(0xff4A2E1F),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Noto Sans KR',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff2D1810),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    introController.dispose();
    super.dispose();
  }
}

