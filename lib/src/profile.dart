import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
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

  Widget _footer() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        child: Row(
          children: [
            Column(
              children: [
                Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  "나와의 채탕",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
