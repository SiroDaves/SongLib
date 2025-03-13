import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PwTableCell {
  String? title;
  pw.TextStyle style;
  bool alignRight;
  double width;

  PwTableCell({
    this.title,
    this.style = const pw.TextStyle(fontSize: 10, color: PdfColors.black),
    this.alignRight = false,
    this.width = 0,
  });
}

pw.TextStyle pdfTextStyleBold(
  double fontSize, {
  bool isBold = false,
  PdfColor color = PdfColors.black,
}) {
  return pw.TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
  );
}

pw.Paragraph tableCellText(
  String text, {
  pw.EdgeInsets edgeInsets = const pw.EdgeInsets.only(left: 5, top: 5),
  PdfColor color = PdfColors.black,
  pw.TextAlign textAlign = pw.TextAlign.justify,
}) {
  return pw.Paragraph(
    text: text.replaceAll(' ', ' '),
    style: pdfTextStyleBold(10, color: color),
    padding: edgeInsets,
    textAlign: textAlign,
  );
}

pw.Widget singleTableCell(
    {required double height,
    required pw.Widget child,
    double? width = double.infinity}) {
  return pw.Container(
    width: width,
    height: height,
    margin: const pw.EdgeInsets.all(0),
    padding: const pw.EdgeInsets.symmetric(horizontal: 10),
    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.black, width: 1),
    ),
    child: child,
  );
}

pw.Row rowTable(
    {required List<PwTableCell> children,
    double height = 0,
    PdfColor? borderColor}) {
  String longestItem = '';
  for (var item in children) {
    if (item.title!.length > longestItem.length) {
      longestItem = item.title!;
    }
  }
  if (height == 0) {
    longestItem.length > 14 ? (longestItem.length / 14).round() * 15 : 16;
  }

  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    mainAxisAlignment: pw.MainAxisAlignment.start,
    children: [
      for (var item in children)
        if (item.width == 0)
          tableCell(
            height: height,
            expand: true,
            child: tableText(item),
            borderColor: borderColor,
          )
        else
          tableCell(
            height: height,
            width: item.width,
            child: tableText(item),
            borderColor: borderColor,
          ),
    ],
  );
}

pw.Widget tableCell({
  required double height,
  required pw.Widget child,
  bool expand = false,
  double width = 0,
  PdfColor? borderColor,
}) {
  return expand
      ? pw.Expanded(
          child: pw.Container(
            height: height,
            margin: const pw.EdgeInsets.all(0),
            padding: const pw.EdgeInsets.all(5),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                  color: borderColor ?? PdfColors.black, width: 1),
            ),
            child: child,
          ),
        )
      : pw.Container(
          height: height,
          width: width,
          margin: const pw.EdgeInsets.all(0),
          padding: const pw.EdgeInsets.all(5),
          decoration: pw.BoxDecoration(
            border:
                pw.Border.all(color: borderColor ?? PdfColors.black, width: 1),
          ),
          child: child,
        );
}

pw.Widget tableText(PwTableCell item) {
  return pw.Text(
    item.title!,
    style: item.style,
    textAlign: item.alignRight ? pw.TextAlign.right : pw.TextAlign.justify,
  );
}

pw.Row tableRowQuotation({
  required List<pw.Widget> children,
}) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    mainAxisAlignment: pw.MainAxisAlignment.start,
    children: children,
  );
}

pw.Widget tableCellQuotation({
  required pw.Widget child,
  bool expand = false,
  double? height,
  double? width,
  PdfColor? bgColor,
  PdfColor? borderColor,
  pw.EdgeInsets? margin,
  pw.BoxConstraints? constraints,
  pw.EdgeInsets padding =
      const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 5),
}) {
  var current = child;
  constraints = (width != null || height != null)
      ? constraints?.tighten(width: width, height: height) ??
          pw.BoxConstraints.tightFor(width: width, height: height)
      : constraints;

  if (constraints != null) {
    current = pw.ConstrainedBox(constraints: constraints, child: current);
  }

  current = pw.Padding(padding: padding, child: current);

  if (borderColor != null) {
    current = pw.DecoratedBox(
      decoration: pw.BoxDecoration(
        color: bgColor,
        border: pw.Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: current,
    );
  }

  if (margin != null) {
    current = pw.Padding(padding: margin, child: current);
  }
  if (expand) {
    current = pw.Expanded(child: current);
  }
  return current;
}

pw.Widget tableTextQuotation(PwTableCell item) {
  return pw.Text(
    item.title!,
    style: item.style,
    textAlign: item.alignRight ? pw.TextAlign.right : pw.TextAlign.justify,
  );
}
