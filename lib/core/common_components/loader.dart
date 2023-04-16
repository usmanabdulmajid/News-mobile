import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class Loader {
  Loader(this.context, {this.allowBackButton = false});
  final bool allowBackButton;
  final BuildContext context;

  void show() {
    unawaited(
      Navigator.push(
        context,
        PageRouteBuilder(
          fullscreenDialog: true,
          opaque: false,
          barrierColor: Colors.transparent,
          pageBuilder: (_, __, ___) {
            return ProgressLoader(allowBackButton: allowBackButton);
          },
        ),
      ),
    );
  }

  void close() {
    Navigator.pop(context);
  }
}

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({this.allowBackButton = false, Key? key})
      : super(key: key);
  final bool allowBackButton;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(allowBackButton);
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.3),
        body: const Center(
          child: CupertinoActivityIndicator(radius: 12),
        ),
      ),
    );
  }
}
