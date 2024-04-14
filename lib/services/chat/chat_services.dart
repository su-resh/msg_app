import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:msg_app/model/message.dart';


class ChatService{
  // get unstance of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // get user stream
  
 Stream<List<Map<String, dynamic>>> getUsersStream() {
  return _firestore.collection("Users").snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final user = doc.data();
      return user;
    }).toList(); // Convert Iterable to List
  });
}

  // send message
void sendMessage(String receiverID, message)
async{
  // get current user info
  final String currentUserId = _auth.currentUser!.uid;
  final String currentUserEmail = _auth.currentUser!.email!;
  final Timestamp timestamp = Timestamp.now();
  // create a new message

  Message newMessage = Message(
    senderID: currentUserId,
    senderEmail: currentUserEmail,
    receiverID: receiverID,
    message: message,
    timestamp: timestamp
  );

  // construct chat room ID for the two users (sorted to ensure uniqueness)
  List <String> ids = [currentUserId, receiverID];
  ids.sort(); // sort the ids
  String chatRoomID = ids.join("_");
  
  // add message to database
  await _firestore.collection("chat_rooms")
  .doc(chatRoomID).collection("message")
  .add(newMessage.toMap());
}

  // get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID){
    // construct chat room ID for the two users (sorted to ensure uniqueness)
    List <String> ids = [userID, otherUserID];
    ids.sort(); // sort the ids
    String chatRoomID = ids.join("_");
    return _firestore.collection("chat_rooms")
    .doc(chatRoomID).collection("message")
    .orderBy("timestamp", descending: true)
    .snapshots();
   
  }
}