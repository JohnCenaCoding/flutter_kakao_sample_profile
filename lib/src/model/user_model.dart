import 'dart:io';

class UserModel {
  String? uid;
  String? doCid;
  String? name;
  String? discription;
  String? avatarUrl;
  String? backgroundUrl;
  //두 file은 화면을 위한 것이다. file을 업로드하고 DB에다가는 file을 등록할 필요가 없기 때문에,
  //file은 storage에 저장되고, DB에다가는 저장 되어 있는 url주소만 가지고 있으면 된다.
  //그래서 생성자에 포함이 안되었다.
  File? avatarFile;
  File? backgroundFile;
  DateTime? lastLoginTime;
  DateTime? createdTime;

  UserModel({
    //uid는 firebase에 로그인을 하게 되면 가지는 고유한 유저의 키
    this.uid,
    //firebase clouddatastorage에 저장을 할 때 사용하는 document id,
    //documnetid로 찾고, insert하고 , update 할 수 있다.
    this.doCid,
    // 카톡 프사 이름
    this.name,
    // 카톡 상태메세지
    this.discription,
    //프로필사진 url
    this.avatarUrl,
    //배경이미지 url
    this.backgroundUrl,
    this.lastLoginTime,
    this.createdTime,
  });

  UserModel.clone(UserModel user)
      : this(
          uid: user.uid,
          doCid: user.doCid,
          name: user.name,
          discription: user.discription,
          avatarUrl: user.avatarUrl,
          backgroundUrl: user.backgroundUrl,
          lastLoginTime: user.lastLoginTime,
          createdTime: user.createdTime,
        );

  void initImageFile() {
    avatarFile = null;
    backgroundFile = null;
  }
}
