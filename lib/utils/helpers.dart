import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/default_imports.dart';


class Helper {
  static final Helper _helper = Helper._internal();

  factory Helper() {
    return _helper;
  }

  Helper._internal();

  String validString(String? strText) {
    try {
      if (strText == null) {
        return "";
      }
      if (strText.trim().isEmpty) {
        return "";
      }
      return strText.trim();
    } catch (e) {
      Helper().printMessage(e);
      return "";
    }
  }

  void hideKeyBoard(BuildContext context) {
    try {
      FocusScope.of(context).unfocus();
    } catch (e) {
      Helper().printMessage(e);
    }
  }

  void printMessage(message) {
    if (kDebugMode) {
      debugPrint(message);
    }
  }

  void showToast(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
      margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
      content: Text(message),
    ));
  }

  Future<Uint8List> getBytesFromCanvas(
      int width, int height, String text, bool isSelect) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()
      ..color = (isSelect ? Colors.teal[900] : Colors.teal)!;
    const Radius radius = Radius.circular(100);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    TextPainter painter = TextPainter();
    painter.text = TextSpan(
      text: text,
      style: const TextStyle(fontSize: 20.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
