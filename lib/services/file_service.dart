import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:path_provider/path_provider.dart';

class FileService extends ChangeNotifier {
  Future downloadFile(String filePath, int fileId, String fileName) async {
    var dir = await getApplicationDocumentsDirectory();
    print('Downloading $filePath');
    return api
        .fileDownload(filePath, "${dir.path}/$fileName$fileId")
        .then((response) {
      // var payload = response.data;
    }).catchError((error) {
      print('Couldnt download file $fileName');
    });
  }
}

FileService fileService = FileService();
