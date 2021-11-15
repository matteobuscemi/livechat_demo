import 'package:livechat_demo/SocketIOChat/chatUsersScreen.dart';
import 'package:livechat_demo/SocketIOChat/loginScreen.dart';
import 'package:livechat_demo/main.dart';
import 'package:livechat_demo/SocketIOChat/loginScreen.dart';

class Routes{
  static routes() {
    return {
      LoginScreen.ROUTE_ID: (context) => LoginScreen(),
      ChatUsersScreen.ROUTE_ID: (context) => ChatUsersScreen(),

    };
  }

  static initScreen() {
    return LoginScreen.ROUTE_ID;
  }
}