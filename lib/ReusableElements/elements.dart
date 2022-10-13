import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:crm_fdscarrier/ReusableElements/constants.dart';

Future dialogLoading(BuildContext context, Future<bool> future) {
  return showDialog(
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  contentPadding: EdgeInsets.zero,
                  insetPadding: EdgeInsets.zero,
                  content: Center(
                    child: Image.asset(
                      logoloading,
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                  ),
                ),
              );
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                Navigator.pop(context);
                return const SizedBox();
              }
          }
        },
      );
    },
  );
}
