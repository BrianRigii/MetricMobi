import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metric/data/models/message_model.dart';
import 'package:metric/services/assigned_user_service.dart';
import 'package:metric/services/auth_service.dart';
import 'package:metric/services/error_service.dart';
import 'package:metric/services/messaging_service.dart';
import 'package:metric/widgets/app_drawer.dart';
import 'package:metric/widgets/circular_material_spinner.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  _loadMessages() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      messagingService
          .loadMessages(authService.authUser.id)
          .catchError((error) {
        errorService.errorHandler(error: error, context: context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 45.0, left: 16.0, right: 16.0, bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _key.currentState.openDrawer();
                            },
                            child: SvgPicture.asset(
                                'assets/images/menu_icon.svg')),
                        Row(
                          children: [
                            Icon(
                              EvaIcons.bellOutline,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(150)),
                              child: Image.asset(
                                'assets/images/strath_logo.jpg',
                                height: 40,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Messages',
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              )),
          Expanded(
              child: Selector<MessagingService, bool>(
                  selector: (context, messagingService) =>
                      messagingService.isGettingMessages,
                  builder: (context, isGettingMessages, _) {
                    return CircularMaterialSpinner(
                      loading: isGettingMessages,
                      color: Theme.of(context).primaryColor,
                      child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: messagingService.messages.length,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return _MessageTile(
                              message: messagingService.messages[index],
                            );
                          }),
                    );
                  }))
        ]));
  }
}

class _MessageTile extends StatelessWidget {
  final MessageModel message;
  const _MessageTile({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: false,
      dense: true,
      title: Text(
        assignedUserService.users
                .firstWhere((element) => element.id == message.senderId,
                    orElse: () => null)
                ?.name ??
            'John Doe',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text("${message.message}"),
    );
  }
}
