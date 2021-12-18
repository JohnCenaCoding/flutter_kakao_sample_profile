import 'package:flutter/material.dart';

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
      child: Container(),
    );
  }
}
