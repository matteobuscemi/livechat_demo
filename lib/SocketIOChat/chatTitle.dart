import 'package:flutter/material.dart';
import 'package:livechat_demo/SocketIOChat/chatScreen.dart';
import 'user.dart';

class ChatTitle extends StatelessWidget {
  //
  const ChatTitle({
    Key key,
    @required this.toChatUser,
    @required this.userOnlineStatus,
  }) : super(key: key);

  final User toChatUser;
  final UserOnlineStatus userOnlineStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(toChatUser.name),
          Text(
            _getStatusText(),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }

  _getStatusText() {
    if (userOnlineStatus == UserOnlineStatus.connecting) {
      return 'connecting...';
    }
    if (userOnlineStatus == UserOnlineStatus.online) {
      return 'online';
    }
    if (userOnlineStatus == UserOnlineStatus.not_online) {
      return 'not online';
    }
  }
}
