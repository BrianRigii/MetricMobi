import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:metric/widgets/container_border.dart';

class AddDisscusionScreen extends StatefulWidget {
  const AddDisscusionScreen({Key key}) : super(key: key);

  @override
  _AddDisscusionScreenState createState() => _AddDisscusionScreenState();
}

class _AddDisscusionScreenState extends State<AddDisscusionScreen> {
  TextEditingController disscusionTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              cursorColor: Theme.of(context).primaryColor,
              maxLines: 5,
              autofillHints: [],
              decoration: InputDecoration(
                  hintText: 'Whats on your mind ?',
                  border: InputBorder.none,
                  focusColor: Theme.of(context).primaryColor,
                  prefixIconConstraints: BoxConstraints(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(EvaIcons.personOutline),
                  )),
            ),
          ),
          _BottomActions(),
        ],
      ),
    );
  }
}

class _BottomActions extends StatefulWidget {
  const _BottomActions({Key key}) : super(key: key);

  @override
  __BottomActionsState createState() => __BottomActionsState();
}

class __BottomActionsState extends State<_BottomActions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerBorder(
          color: Colors.black,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(EvaIcons.mapOutline),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(EvaIcons.calendarOutline),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(EvaIcons.attach2Outline),
              color: Theme.of(context).primaryColor,
            )
          ],
        )
      ],
    );
  }
}
