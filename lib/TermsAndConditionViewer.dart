import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class TermsAndConditionViewer extends StatefulWidget {
  String termsAndConditions;
  TermsAndConditionViewer({@required this.termsAndConditions});

  @override
  _TermsAndConditionViewerState createState() =>
      _TermsAndConditionViewerState();
}

class _TermsAndConditionViewerState extends State<TermsAndConditionViewer> {
  bool _isLoading = true;
  PDFDocument doc;
  @override
  Future<void> didChangeDependencies() async {
    doc = await PDFDocument.fromURL(widget.termsAndConditions);
    setState(() {
      _isLoading = false;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms And Condition"),
      ),
      body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: doc)),
    );
  }
}
