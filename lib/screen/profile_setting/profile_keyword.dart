import 'package:flutter/material.dart';

class ProfileKeywordScreen extends StatefulWidget {
  const ProfileKeywordScreen({super.key});

  @override
  State<ProfileKeywordScreen> createState() => _ProfileKeywordScreenState();
}

class _ProfileKeywordScreenState extends State<ProfileKeywordScreen> {
  final List<String> keywords = [
    'HTML / CSS',
    'JavaScript',
    'TypeScript',
    'React',
    'Vue.js',
    'Java',
    'Spring Boot',
    'Node.js',
    'Express',
    'Python',
    'Flutter',
    'Android (Kotlin)',
    'iOS (Swift)',
    'MySQL',
    'MariaDB',
    'MongoDB',
    'AWS',
    'Docker',
    'Git / GitHub',
    'Figma',
  ];

  final Set<String> selectedKeywords = {};
  final int maxSelection = 5;

  void _toggleKeyword(String keyword) {
    setState(() {
      if (selectedKeywords.contains(keyword)) {
        selectedKeywords.remove(keyword);
      } else {
        if (selectedKeywords.length < maxSelection) {
          selectedKeywords.add(keyword);
        }
      }
    });
  }

  void _handleComplete() {
    // 완료 버튼 클릭 시 처리 로직
    // Navigator.pop(context);
    // 또는 다음 화면으로 이동
  }

  void _handleSkip() {
    // 나중에 하기 버튼 클릭 시 처리 로직
    Navigator.pop(context);
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
                    color: Color(0xff4A2E1F),
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
                '관심 키워드를 선택해주세요',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2D1810),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '최대 5개까지 선택 가능합니다',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff62748E),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.label,
                        size: 18,
                        color: Color(0xff62748E),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '관심 키워드',
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
                  Text(
                    '${selectedKeywords.length}/$maxSelection',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Noto Sans KR',
                      color: Color(0xff62748E),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: keywords.map((keyword) {
                  final isSelected = selectedKeywords.contains(keyword);
                  final isDisabled =
                      !isSelected && selectedKeywords.length >= maxSelection;

                  return GestureDetector(
                    onTap: isDisabled ? null : () => _toggleKeyword(keyword),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Color(0xffF5E6D3)
                            : Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? Color(0xff4A2E1F)
                              : Colors.transparent,
                          width: isSelected ? 1 : 0,
                        ),
                      ),
                      child: Text(
                        keyword,
                        style: TextStyle(
                          fontFamily: 'Noto Sans KR',
                          fontSize: 14,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected
                              ? Color(0xff2D1810)
                              : (isDisabled
                                    ? Color(0xffC4C4C4)
                                    : Color(0xff62748E)),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 24),
              _buildInfoBox(),
              SizedBox(height: 40),
              GestureDetector(
                onTap: _handleComplete,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xff4A2E1F),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '완료',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Noto Sans KR',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: _handleSkip,
                  child: Text(
                    '나중에 하기',
                    style: TextStyle(
                      fontFamily: 'Noto Sans KR',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff62748E),
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

  Widget _buildInfoBox() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xffFFF8E7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.local_cafe,
            color: Color(0xff4A2E1F),
            size: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '선택한 키워드는 매칭에 활용됩니다',
                  style: TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2D1810),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '비슷한 관심사를 가진 사람들과 연결될 확률이 높아집니다',
                  style: TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff62748E),
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
