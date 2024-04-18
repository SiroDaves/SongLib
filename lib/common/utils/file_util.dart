import 'dart:developer' as logger show log;
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:path/path.dart' as p;
import 'package:pdf/widgets.dart' as pw;

import 'date_util.dart';

Future<void> saveFile(String path, Uint8List content) async {
  final file = File(path);
  await file.writeAsBytes(content);
}

String getShortPath(String path) {
  var f = p.split(path);
  if (f.length > 2) {
    f = f.sublist(f.length - 2);
    return ".../${p.joinAll(f)}";
  }
  return path;
}

/// Downloads directory
Future<String> downloadDir() async {
  Directory directory = Directory('/');
  if (Platform.isMacOS) {
    directory = Directory(
        '/Users/${Platform.environment['USER']}/Downloads');
  } else if (Platform.isWindows) {
    directory = Directory(
        '${Platform.environment['USERPROFILE']}\\Downloads');
  } else if (Platform.isLinux) {
    directory = Directory(
        '/home/${Platform.environment['USER']}/Downloads');
  } else if (Platform.isAndroid) {
    directory = Directory('/storage/emulated/0/Download');
  }
  if (await directory.exists()) {
    //if folder already exists return path
    return directory.path;
  } else {
    //if folder not exists create folder and then return its path
    final Directory directoryNew = await directory.create(recursive: true);
    return directoryNew.path;
  }
}

/// Songlib directory
Future<String> britamDirx() async {
  Directory directory = Directory('/');
  if (Platform.isMacOS) {
    directory = Directory(
        '/Users/${Platform.environment['USER']}/Documents/Songlib');
  } else if (Platform.isWindows) {
    directory = Directory(
        '${Platform.environment['USERPROFILE']}\\Documents\\Songlib');
  } else if (Platform.isLinux) {
    directory = Directory(
        '/home/${Platform.environment['USER']}/Documents/Songlib');
  } else if (Platform.isAndroid) {
    directory = Directory('/storage/emulated/0/Documents/Songlib');
  }
  if (await directory.exists()) {
    //if folder already exists return path
    return directory.path;
  } else {
    //if folder not exists create folder and then return its path
    final Directory directoryNew = await directory.create(recursive: true);
    return directoryNew.path;
  }
}

Future<File> generatePdfFile(String fileName, pw.Document pdf) async {
  late File pdfFile;
  final path = await downloadDir();

  if (path.isNotEmpty) {
    try {
      pdfFile = File(join(path, '$fileName ${filesDateTimeStamp()}.pdf'));
      logger.log('Saved to: ${pdfFile.path}');
      await pdfFile.writeAsBytes(await pdf.save());
      return pdfFile;
    } catch (e) {
      logger.log("An error occurred while saving file.");
      logger.log("Error: $e");
    }
  } else {
    logger.log("Unable to determine the download path.");
  }
  return pdfFile;
}

Future<File> generatePdfFileDownload(String fileName, List<int> pdf) async {
  late File pdfFile;
  final path = await downloadDir();

  if (path.isNotEmpty) {
    try {
      pdfFile = File(join(path, '$fileName ${filesDateTimeStamp()}.pdf'));
      logger.log('Saved to: ${pdfFile.path}');
      await pdfFile.writeAsBytes(pdf);
      return pdfFile;
    } catch (e) {
      logger.log("An error occurred while saving file.");
      logger.log("Error: $e");
    }
  } else {
    logger.log("Unable to determine the download path.");
  }
  return pdfFile;
}

Future<File> generatePdfFileX(String fileName, pw.Document pdf) async {
  final resultPort = ReceivePort();

  await Isolate.spawn(
    pdfGenerationIsolate,
    [resultPort.sendPort, fileName, pdf],
  );

  File pdfFile = await (resultPort.first) as File;
  return pdfFile;
}

Future<void> pdfGenerationIsolate(List<dynamic> args) async {
  late File pdfFile;
  final path = await downloadDir();

  SendPort resultPort = args[0];
  String fileName = args[1];
  pw.Document pdf = args[2];

  if (path.isNotEmpty) {
    try {
      pdfFile = File(join(path, '$fileName ${filesDateTimeStamp()}.pdf'));
      logger.log('Saved to: ${pdfFile.path}');
      await pdfFile.writeAsBytes(await pdf.save());
    } catch (e) {
      logger.log("An error occurred while saving file.");
      logger.log("Error: $e");
    }
  } else {
    logger.log("Unable to determine the download path.");
  }

  Isolate.exit(resultPort, pdfFile);
}
