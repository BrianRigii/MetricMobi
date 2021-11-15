import 'package:detectable_text_field/detector/sample_regular_expressions.dart';

import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:metric/services/unit_students_service.dart';
import 'package:metric/widgets/container_border.dart';

class AddDisscusionScreen extends StatefulWidget {
  const AddDisscusionScreen({Key key}) : super(key: key);

  @override
  _AddDisscusionScreenState createState() => _AddDisscusionScreenState();
}

class _AddDisscusionScreenState extends State<AddDisscusionScreen> {
  TextEditingController disscusionTextController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool showContacts = false;

  onUsertapped(name) {
    var text = "${disscusionTextController.text}${name} ";
    disscusionTextController.text = text;

    disscusionTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: disscusionTextController.text.length));
  }

  void toggleContacts() {
    setState(() {
      showContacts = !showContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [TextButton(onPressed: () {}, child: Text('post'))],
      ),
      body: Stack(children: [
        Column(
          children: [
            Expanded(
                child: CustomeTextInput(
              ctrl: disscusionTextController,
              onDetectFunc: () => toggleContacts(),
            )),
            _BottomActions(),
          ],
        ),
        Visibility(
          visible: showContacts,
          child: DraggableScrollableSheet(builder: (
            context,
            _scrollController,
          ) {
            return SingleChildScrollView(
              controller: _scrollController,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: unitStudentsService.students
                      .map((e) => Column(
                            children: [
                              ListTile(
                                dense: true,
                                leading: Image.asset(
                                    'assets/images/male-avatar.png'),
                                title: Text('${e.name}'),
                                onTap: () {
                                  onUsertapped(e.name);
                                },
                              ),
                              Divider()
                            ],
                          ))
                      .toList(),
                ),
              ),
            );
          }),
        )
      ]),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
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
                  ),
                  Row(
                    children: [
                      Container(
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border(
                                left: BorderSide(
                                    width: 2,
                                    color: Theme.of(context).primaryColor)),
                          )),
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Icon(EvaIcons.sunOutline),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomeTextInput extends StatefulWidget {
  final TextEditingController ctrl;
  final Function onDetectFunc;
  const CustomeTextInput({Key key, this.ctrl, this.onDetectFunc})
      : super(key: key);

  @override
  _CustomeTextInputState createState() => _CustomeTextInputState();
}

class _CustomeTextInputState extends State<CustomeTextInput> {
  @override
  Widget build(BuildContext context) {
    return DetectableTextField(
      maxLines: 500,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Whats on your mind ?',
          contentPadding: EdgeInsets.only(left: 8.0),
          prefix: Image.asset(
            'assets/images/male-avatar.png',
            height: 40,
          )),
      detectionRegExp: detectionRegExp(),
      controller: widget.ctrl,
      onDetectionTyped: (String text) {
        widget.onDetectFunc();
      },
    );
  }
}
