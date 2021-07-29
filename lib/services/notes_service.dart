import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/notes_model.dart';

class NotesService extends ChangeNotifier {
  ValueNotifier<bool> isGettingNotes = ValueNotifier(false);

  set _isGettingNotes(bool val) {
    isGettingNotes.value = val;
  }

  NotesModel notes = NotesModel();
  Future loadNotes(unitId, unitPeriodId) {
    _isGettingNotes = true;
    return api.getNotes(unitId, unitPeriodId).then((response) {
      var payload = response.data;
      _saveNotes(payload);
    }).catchError((error, stack) {
      _isGettingNotes = false;
      print('error occured while loading notes $error');
      print(stack);
    });
  }

  void _saveNotes(payload) {
    notes = NotesModel.fromMap(payload);
    _isGettingNotes = false;
  }
}

NotesService notesService = NotesService();
