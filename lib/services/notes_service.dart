import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/notes_model.dart';

class NotesService extends ChangeNotifier {
  ValueNotifier<bool> isGettingNotes = ValueNotifier(false);

  set _isGettingNotes(bool val) {
    isGettingNotes.value = val;
  }

  List<NotesModel> notes = [];
  Future loadNotes(unitId, unitPeriodId) {
    notes = [];
    _isGettingNotes = true;
    return api.getNotes(unitId, unitPeriodId).then((response) {
      var payload = response.data;
      _saveNotes(payload);
    }).catchError((error) {
      _isGettingNotes = false;
      print('error occured while loading notes');
    });
  }

  void _saveNotes(payload) {
    payload.forEach((note) {
      notes.add(NotesModel.fromMap(note));
    });
    _isGettingNotes = false;
  }
}

NotesService notesService = NotesService();
