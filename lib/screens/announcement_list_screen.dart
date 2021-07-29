import 'package:flutter/material.dart';

import 'package:metric/data/models/announcement_model.dart';
import 'package:metric/data/models/unit_model.dart';
import 'package:metric/services/announcement_service.dart';
import 'package:metric/widgets/circular_material_spinner.dart';

class AnnouncementListScreen extends StatefulWidget {
  const AnnouncementListScreen({Key key}) : super(key: key);

  @override
  _AnnouncementListScreenState createState() => _AnnouncementListScreenState();
}

class _AnnouncementListScreenState extends State<AnnouncementListScreen> {
  @override
  void initState() {
    super.initState();

    callApis();
  }

  void callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      announcementService.loadAnnouncements();
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, UnitModel> arguments =
        ModalRoute.of(context).settings.arguments;

    UnitModel unit = arguments['unit'];
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [Text('Announcements'), Text('${unit.name}')],
          )),
      body: ValueListenableBuilder<bool>(
        valueListenable: announcementService.isGettingAnnouncements,
        builder: (context, isGettingAnnouncements, _) {
          return CircularMaterialSpinner(
            loading: isGettingAnnouncements,
            child: announcementService.announcements.isNotEmpty
                ? ListView.builder(
                    itemCount: announcementService.announcements.length,
                    itemBuilder: (context, index) {
                      return AnnouncementCard();
                    },
                  )
                : SizedBox(),
          );
        },
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({
    Key key,
    this.announcement,
  }) : super(key: key);

  final AnnouncementModel announcement;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
