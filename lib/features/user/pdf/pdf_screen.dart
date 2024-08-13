import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pdf_viewer/pdf_viewer.dart';

import '../../../common/utils/app_util.dart';
import '../../../common/widgets/progress/general_progress.dart';

/// Pdf Viewer Screen
class PdfScreen extends StatefulWidget {
  final File pdf;
  const PdfScreen({Key? key, required this.pdf}) : super(key: key);

  @override
  PdfScreenState createState() => PdfScreenState();
}

@visibleForTesting
class PdfScreenState extends State<PdfScreen> {
  Future<PDFViewer> preparePdfDocument() async {
    try {
      final pdfDoc = await PDFDocument.fromFile(widget.pdf);
      return PDFViewer(
        document: pdfDoc,
        scrollDirection: Axis.vertical,
        showNavigation: false,
      );
    } catch (e) {
      logger('We are unable to open that PDF. We ran into an $e');
      return PDFViewer(document: PDFDocument());
    }
  }

  @override
  Widget build(BuildContext context) {
    String pdfTitle = basename(widget.pdf.path);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(pdfTitle),
      ),
      body: FutureBuilder(
        future: preparePdfDocument(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: snapshot.data);
          } else {
            return const EmptyState();
          }
        },
      ),
    );
  }
}
