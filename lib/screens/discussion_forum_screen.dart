import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:metric/data/models/discussion_model.dart';
import 'package:metric/routes.dart';
import 'package:metric/services/discussion_service.dart';
import 'package:metric/services/error_service.dart';
import 'package:metric/widgets/circular_material_spinner.dart';

class DiscussionForum extends StatefulWidget {
  const DiscussionForum({Key key}) : super(key: key);

  @override
  _DiscussionForumState createState() => _DiscussionForumState();
}

class _DiscussionForumState extends State<DiscussionForum> {
  @override
  void initState() {
    super.initState();

    callApis();
  }

  void callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //TODO: Pass unit id
      discusionService.loadDiscussions(1).catchError((error) {
        errorService.errorHandler(error: error, context: context);
      });
    });
  }

  void fabfn() {
    Navigator.of(context).pushNamed(RouteConfig.addDisscusionScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion Forums'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(EvaIcons.plusOutline),
        onPressed: fabfn,
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: discusionService.isGettingDiscussions,
        builder: (context, isGettingDisccusions, _) {
          return CircularMaterialSpinner(
            loading: isGettingDisccusions,
            color: Theme.of(context).primaryColor,
            child: discusionService.discussions.isNotEmpty
                ? ListView.builder(
                    itemCount: discusionService.discussions.length,
                    itemBuilder: (context, index) {
                      return DiscussionCard(
                        discussion: discusionService.discussions[index],
                      );
                    },
                  )
                : Center(child: Text('No disscusions')),
          );
        },
      ),
    );
  }
}

class DiscussionCard extends StatelessWidget {
  final DiscusionModel discussion;
  const DiscussionCard({Key key, this.discussion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            dense: true,
            subtitle: Text('${discussion.user}'),
            isThreeLine: true,
            title: Text('${discussion.title}'),
          ),
        ),
        Divider()
      ],
    );
  }
}
