// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/components/pop_up/app_pop_up.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermission(Permission permission, {BuildContext? cnt}) async {
  BuildContext context = cnt ?? rootNavigatorKey.currentContext!;

  // Handle Storage Permission for Android 13+ (MANAGE_EXTERNAL_STORAGE)
  if (Platform.isAndroid && permission == Permission.storage) {
    int androidVersion = (await DeviceInfoPlugin().androidInfo).version.sdkInt;

    if (androidVersion >= 33) {
      permission = Permission.photos; // Use this for full access
    }
  }

  PermissionStatus status = await permission.request();
  log('permission status: $status');

  String deniedMsg = "App needs access to your ";

  if (permission == Permission.photos) {
    deniedMsg += "Storage";
  } else if (permission == Permission.storage) {
    deniedMsg += "Storage";
  } else if (permission == Permission.notification) {
    deniedMsg += "Notification";
  } else if (permission == Permission.microphone) {
    deniedMsg += "Microphone";
  } else if (permission == Permission.camera) {
    deniedMsg += "Camera";
  } else if (permission == Permission.audio) {
    deniedMsg += "Audio files";
  } else if (permission == Permission.mediaLibrary) {
    deniedMsg += "Media Library";
  } else if (permission == Permission.location) {
    deniedMsg += "Location";
  }

  deniedMsg += ", Please allow this permission from settings.";
  if (status.isPermanentlyDenied || status.isDenied) {
    if (Platform.isIOS) {
      await showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
            title: const Text(
              "Permission Required",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            message: Text(
              deniedMsg,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              CupertinoActionSheetAction(
                child: const Text(
                  "Open Settings",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onPressed: () async {
                  await openAppSettings();
                  Navigator.pop(context);
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.pop(context),
            )),
      );
    } else {
      await AppPopUp.show(
        context,
        title: "Permission Required",
        description: deniedMsg,
        actions: [
          const SizedBox(height: 10),
          AppButton(
            label: 'Cancel',
            backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
            textColor: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
          AppButton(
            label: 'Open Settings',
            onPressed: () async {
              await openAppSettings();
              Navigator.pop(context);
            },
          ),
        ],
      );
    }
    return await permission.isGranted;
  }

  log('permission status: $status');
  return status.isGranted || status.isLimited;
}
