import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_sample_profile/src/controller/profile_controller.dart';

class Profile extends GetView<ProfileController> {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3f3f3f),
      body: Container(
        child: Stack(
          children: [
            _backgroundImage(),
            _header(),
            _myProfile(),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundImage() {
    //이렇게 하면 전체 영역을 차지
    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      left: 0,
      child: GestureDetector(
        onTap: () {
          print("change my backgroundimage!");
        },
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }

  Widget _header() {
    return Positioned(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                print("프로필 편집 취소");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                  Text(
                    "프로필 편집",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("프로필 편집 저장");
              },
              child: Text(
                "완료",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      //top을 이렇게 해두면 상태표시줄 부분에 가리지 않게 할 수 있다.
      top: Get.mediaQuery.padding.top,
      left: 0,
      right: 0,
    );
  }

  Widget _oneButton(IconData icon, String title, void Function()? ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _footer() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          width: 1,
          color: Colors.white.withOpacity(0.4),
        ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _oneButton(Icons.chat_bubble, "나와의 채팅", () {}),
            _oneButton(Icons.edit, "프로필 편집", controller.toggleEditProfile),
            _oneButton(Icons.chat_bubble_outline, "카카오스토리", () {}),
          ],
        ),
      ),
    );
  }

  Widget _myProfile() {
    return Obx(
      () => Positioned(
        bottom: 130,
        left: 0,
        right: 0,
        child: Container(
          height: 200,
          child: Column(
            children: [
              _profileImage(),
              _profileInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return Container(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.network(
          "https://i.stack.imgur.com/l60Hf.png",
          //cover는 이미지를 풀로 채워줌.
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _profileInfo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "존시나",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
        Text(
          "FU와 U can't see me ",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ],
    );
  }
}
