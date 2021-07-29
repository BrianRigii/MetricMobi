import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:metric/data/models/notes_model.dart';
import 'package:metric/services/file_service.dart';
import 'package:metric/widgets/circular_material_spinner.dart';

import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';

class DocumentViewerScreen extends StatefulWidget {
  const DocumentViewerScreen({Key key}) : super(key: key);

  @override
  _DocumentViewerScreenState createState() => _DocumentViewerScreenState();
}

class _DocumentViewerScreenState extends State<DocumentViewerScreen> {
  PdfController _pdfController;
  bool isDownloadingFile = true;
  Map<String, dynamic> arguments;
  NotesModel note;
  AttachmentModel attachment;

  @override
  void initState() {
    super.initState();
    checkFiles();
  }

  void checkFiles() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      arguments = ModalRoute.of(context).settings.arguments;
      note = arguments['note'];
      attachment = arguments['attachment'];

      setState(() {
        isDownloadingFile = true;
      });

      var dir = await getApplicationDocumentsDirectory();

      if (await File("${dir.path}/${attachment.name}${attachment.id}")
          .exists()) {
        _pdfController = PdfController(
            document: PdfDocument.openFile(
                "${dir.path}/${attachment.name}${attachment.id}"));
        print('file exists');
        setState(() {
          isDownloadingFile = false;
        });
      } else {
        print('downloading file');
        fileService
            .downloadFile(attachment.path, attachment.id, attachment.name)
            .then((value) {
          _pdfController = PdfController(
              document: PdfDocument.openFile(
                  "${dir.path}/${attachment.name}${attachment.id}"));
        });
        setState(() {
          isDownloadingFile = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${attachment.name}'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.arrowIosBackOutline),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.arrowIosForwardOutline),
          )
        ],
      ),
      body: CircularMaterialSpinner(
        loading: isDownloadingFile,
        color: Theme.of(context).primaryColor,
        child: PdfView(
          documentLoader: Center(child: CircularProgressIndicator()),
          pageLoader: Center(child: CircularProgressIndicator()),
          controller: _pdfController,
          onDocumentError: (error) {
            print('file error $error');
          },
        ),
      ),
    );
  }
}
