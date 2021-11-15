// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:livechat_demo/SocketIOChat/chatScreen.dart';
import 'package:livechat_demo/SocketIOChat/global.dart';
import 'package:livechat_demo/SocketIOChat/loginScreen.dart';
import 'package:livechat_demo/SocketIOChat/user.dart';

class ChatUsersScreen extends StatefulWidget {
  ChatUsersScreen() : super();

  static const String ROUTE_ID = 'chat_users_screen';

  @override
  _ChatUsersScreenState createState() => _ChatUsersScreenState();
}

class _ChatUsersScreenState extends State<ChatUsersScreen> {
  List<User> _chatUsers;

  @override
  void initState() {
    super.initState();
    _chatUsers = G.getUsersFor(G.loggedInUser);
  }

  _openChatScreen(context) async {
    await Navigator.pushNamed(
      context,
      ChatScreen.ROUTE_ID,
    );
  }

  _openLoginScreen(context) async {
    await Navigator.pushReplacementNamed(
      context,
      LoginScreen.ROUTE_ID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Livechat Demo - Chat Users"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _openLoginScreen(context);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: _chatUsers.length,
                  itemBuilder: (context, index) {
                    User user = _chatUsers[index];
                    return ListTile(
                      onTap: () {
                        G.toChatUser = user;
                        _openChatScreen(context);
                      },
                      title: Text(user.name),
                      subtitle: Text('ID ${user.id}, Email: ${user.email}'),
                    );
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
