import 'package:flutter/material.dart';
import 'package:metric/services/auth_service.dart';
import 'package:metric/services/error_service.dart';
import 'package:metric/services/messaging_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    messagingService.loadMessages(authService.authUser.id).catchError((error) {
      errorService.errorHandler(error: error, context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 25, left: 8, right: 8, bottom: 8),
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Messages',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
