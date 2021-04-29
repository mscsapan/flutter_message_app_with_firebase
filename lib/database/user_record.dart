import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore data = FirebaseFirestore.instance;

  Future<void> saveUserInfo(Map map) {
    return data.collection("users").add(map);
  }

  searchUser(String username) async {
    return await data
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  createChatRoom(String chatRoomId, Map chatMap) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
