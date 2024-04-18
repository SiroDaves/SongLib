import 'dart:io';

import 'package:flutter/widgets.dart';

import 'zoomable_widget.dart';

/// A class to represent PDF page
/// [imgPath], path of the image (pdf page)
/// [num], page number
/// [onZoomChanged], function called when zoom is changed
/// [zoomSteps], number of zoom steps on double tap
/// [minScale] minimum zoom scale
/// [maxScale] maximum zoom scale
/// [panLimit] limit for pan
class PDFPage extends StatefulWidget {
  final String? imgPath;
  final int num;
  final Function(double)? onZoomChanged;
  final int zoomSteps;
  final double minScale;
  final double maxScale;
  final double panLimit;
  const PDFPage(
    this.imgPath,
    this.num, {Key? key, 
    this.onZoomChanged,
    this.zoomSteps = 3,
    this.minScale = 1.0,
    this.maxScale = 5.0,
    this.panLimit = 1.0,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PDFPageState createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  late ImageProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _repaint();
  }

  @override
  void didUpdateWidget(PDFPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imgPath != widget.imgPath) {
      _repaint();
    }
  }

  void _repaint() {
    provider = FileImage(File(widget.imgPath!));
    final resolver = provider.resolve(createLocalImageConfiguration(context));
    resolver.addListener(ImageStreamListener((imgInfo, alreadyPainted) {
      if (mounted && !alreadyPainted) setState(() {});
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: null,
      child: ZoomableWidget(
        onZoomChanged: widget.onZoomChanged,
        zoomSteps: widget.zoomSteps,
        minScale: widget.minScale,
        panLimit: widget.panLimit,
        maxScale: widget.maxScale,
        child: Image(image: provider),
      ),
    );
  }
}
