import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textEditingController=TextEditingController() ;
  String email;
  bool isMe;
  String password;
  final _firestore=Firestore.instance;
  final _auth= FirebaseAuth.instance;

  String loggin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
  }
  // getChat()async{
  //  await for( var snapshot in _firestore.collection('message').snapshots()) {
  //     for (var massage in snapshot.documents) {
  //       print(massage.data);
  //     }
  //   }
  // }
  void getDate()async {
    final user = await _auth.currentUser();
    if (user != null) {
      loggin = user.email;
      print(loggin);
    }
  }
  String senderMassage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Center(child: Text("Group Chat 💬  ")),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         StreamBuilder<QuerySnapshot>(
             stream: _firestore.collection('message').snapshots(),
             // ignore: missing_return
             builder: (context,snapshot){
                 final massage = snapshot.data.documents.reversed;
                 final List<Widget> massageWidgets=[];
                 for(var massage in massage){
                  final messageText = massage.data['text'];
                    final messageSender =massage.data['sender'];
                     final massageWidget=BlueButton(text: messageText,sender: messageSender,isMe: messageSender==loggin,);
                        massageWidgets.add(massageWidget);
                         }
                 return Expanded(
                   child: ListView(
                     reverse: true,
                     children: massageWidgets
                   ),
                 );
               }
             ),
          Container(padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent,width: 5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: textEditingController,
              onChanged: (value){
              senderMassage=value;
            },
              decoration: InputDecoration(
                  hintText: "Enter Message",
                  suffixIcon: GestureDetector(
                    onTap: ()async{
                      textEditingController.clear();
                      await _firestore.collection('message').add({
                        'text':senderMassage,
                        'sender':loggin,
                      });

                    },
                    child: Icon(
                      Icons.send,
                      size: 30,
                    ),
                  )
              ),
            ),
          )
        ],
        ),
    );
  }
}
class BlueButton extends StatelessWidget {
  BlueButton({this.text,this.sender,this.isMe});
  final sender;
  final isMe;
  final text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end :CrossAxisAlignment.start,
        children: [
          Text(sender,style: TextStyle(
            fontSize: 12,
            color: Colors.black54
          ),),
          Padding(
            padding:  EdgeInsets.all(8),
            child: Material(

              child:Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: isMe?Colors.blueAccent: Colors.white10,
                  borderRadius:isMe? BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)):BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                ),
                child: Text(text,style: TextStyle(
                  fontSize: 15,
                  color: isMe?Colors.white: Colors.black
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

