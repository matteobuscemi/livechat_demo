import 'package:livechat_demo/SocketIOChat/loginScreen.dart';
import 'package:livechat_demo/main.dart';

class Routes{
  static routes() {
    return {
      LoginScreen.ROUTE_ID: (context) => LoginScreen(),

    };
  }

  static initScreen() {
    return LoginScreen.ROUTE_ID;
  }
}