import 'package:flutter/material.dart';
import 'package:metric/data/models/notes_model.dart';
import 'package:metric/data/models/unit_model.dart';
import 'package:metric/routes.dart';
import 'package:metric/services/notes_service.dart';
import 'package:metric/utils/time_util.dart';
import 'package:metric/widgets/circular_material_spinner.dart';

class NotesInfoScreen extends StatefulWidget {
  const NotesInfoScreen({Key key}) : super(key: key);

  @override
  _NotesInfoScreenState createState() => _NotesInfoScreenState();
}

class _NotesInfoScreenState extends State<NotesInfoScreen> {
  Map<String, UnitModel> arguments;
  UnitModel unit;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context).settings.arguments;
    unit = arguments['unit'];
    callApis();
  }

  void callApis() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notesService.loadNotes(unit.id, unit.id);
    });
  }

  void noteTapedFn(AttachmentModel file) {
    Navigator.of(context).pushNamed(RouteConfig.documentviewerscreen,
        arguments: {'attachment': file});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ValueListenableBuilder<bool>(
          valueListenable: notesService.isGettingNotes,
          builder: (context, gotNotes, _) {
            return CircularMaterialSpinner(
              loading: gotNotes,
              color: Theme.of(context).primaryColor,
              child: ListView.builder(
                  itemCount: notesService.notes?.attachments?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        noteTapedFn(notesService.notes.attachments[index]);
                      },
                      leading: Image.asset(
                        'assets/images/word.png',
                      ),
                      title:
                          Text('${notesService.notes.attachments[index].name}'),
                      subtitle: Text(
                          '${displayDatesFormat(notesService.notes.createdAt)}'),
                    );
                  }),
            );
          }),
    );
  }
}
