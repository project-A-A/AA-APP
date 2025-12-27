import 'package:flutter/material.dart';
import 'package:project_aa/screen/profile_setting/profile_intro.dart';
import 'package:project_aa/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final TextEditingController jobController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      print('이미지 선택 오류: $e');
    }
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
                    color: Color(0xffE2E8F0),
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
                '기본 정보를 입력해주세요',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2D1810),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '커피챗 매칭을 위한 정보입니다',
                style: TextStyle(
                  fontFamily: 'Noto Sans KR',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff62748E),
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xffE2E8F0),
                          width: 2,
                        ),
                      ),
                      child: _profileImage != null
                          ? ClipOval(
                              child: Image.file(
                                _profileImage!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(
                              Icons.person,
                              size: 60,
                              color: Color(0xffC4C4C4),
                            ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff4A2E1F),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              _buildTextField(
                label: '직무/직책',
                hint: '예) 프로덕트 디자이너',
                controller: jobController,
                icon: Icons.business_center,
                isRequired: true,
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: '회사/소속',
                hint: '예) 토스',
                controller: companyController,
                icon: Icons.business_center,
                isRequired: false,
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: '지역',
                hint: '예) 서울 강남구',
                controller: regionController,
                icon: Icons.location_on,
                isRequired: false,
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileIntroScreen(),
                    ),
                  );
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

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    required bool isRequired,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: Color(0xff62748E),
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Noto Sans KR',
                color: Color(0xff2D1810),
              ),
            ),
            if (isRequired)
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
        TextFormField(
          controller: controller,
          cursorColor: Color(0xff2D1810),
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
              fontFamily: 'Noto Sans KR',
              color: Color(0xff0A0A0A).withOpacity(0.5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    jobController.dispose();
    companyController.dispose();
    regionController.dispose();
    super.dispose();
  }
}
