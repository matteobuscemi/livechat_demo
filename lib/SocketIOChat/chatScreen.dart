// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:livechat_demo/SocketIOChat/chatMessageModel.dart';
import 'package:livechat_demo/SocketIOChat/chatTitle.dart';
import 'package:livechat_demo/SocketIOChat/global.dart';
import 'package:livechat_demo/SocketIOChat/loginScreen.dart';
import 'package:livechat_demo/SocketIOChat/user.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen() : super();

  static const String ROUTE_ID = 'chat_users_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessageModel> _chatMessages;
  User _toChatUser;
  UserOnlineStatus _userOnlineStatus;

  @override
  void initState() {
    super.initState();
    _chatMessages = List();
    _toChatUser = G.toChatUser;
    _userOnlineStatus = UserOnlineStatus.connecting;
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ChatTitle(
          toChatUser: _toChatUser,
          userOnlineStatus: _userOnlineStatus,
        ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
             Expanded(
                child: ListView.builder(
                  itemCount: _chatMessages.length,
                  itemBuilder: (context, index) {
                    ChatMessageModel chatMessageModel = _chatMessages[index];
                    return Text(chatMessageModel.message);
                  },
                ),
              ),
              _bottomChatArea(),
            ],
          ),
        ));
  }
_bottomChatArea() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          _chatTextArea(),
          IconButton(icon: Icon(Icons.send), onPressed: () {})
        ],
      ),
    );
  }

  _chatTextArea() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Type message',
        ),
      ),
    );
  }

}
enum UserOnlineStatus { connecting, online, not_online }