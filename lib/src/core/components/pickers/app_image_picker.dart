import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/services/theme/app_colors.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker extends StatefulWidget {
  /// The aspect ratio of the image picker, default aspect ratio is 3:1.
  final double aspectRatio;
  final double? size;
  final String? imageUrl;
  final Function(String pickedImage)? onImagePicked;

  const AppImagePicker({
    super.key,
    this.size,
    this.imageUrl,
    this.onImagePicked,
    this.aspectRatio = 3 / 1,
  });

  @override
  State<AppImagePicker> createState() => _AppImagePickerState();

  static Future<File?> showPopUp({required BuildContext context}) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          width: double.infinity,
          height: 180,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: context.theme.appColors.secondaryBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      context.pop(await _pickImage(ImageSource.camera));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.appColors.background,
                        border: Border.all(
                          color: context.theme.appColors.borderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: context.theme.appColors.primary,
                            ),
                            // const SizedBox(height: 10),
                            Text(
                              context.localization.takePhoto,
                              style: context.theme.appTextTheme.title4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      context.pop(await _pickImage(ImageSource.gallery));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.appColors.background,
                        border: Border.all(
                          color: context.theme.appColors.borderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.image,
                              size: 40,
                              color: context.theme.appColors.primary,
                            ),
                            // const SizedBox(height: 10),
                            Text(
                              context.localization.fromGallery,
                              style: context.theme.appTextTheme.title4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<File?> _pickImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      return File(file.path);
    }
    return null;
  }
}

class _AppImagePickerState extends State<AppImagePicker> {
  String? _pickedImagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Center(
        child: AspectRatio(
          aspectRatio: widget.aspectRatio,
          child: CupertinoButton(
            onPressed: () {
              AppImagePicker.showPopUp(context: context).then(
                (file) {
                  if (file != null) {
                    widget.onImagePicked?.call(file.path);
                    setState(() {
                      _pickedImagePath = file.path;
                    });
                  }
                },
              );
            },
            padding: EdgeInsets.zero,
            minSize: 0,
            child: _pickedImagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.file(
                      File(_pickedImagePath!),
                      fit: BoxFit.cover,
                      width: widget.size ?? double.infinity,
                      height: widget.size,
                    ),
                  )
                : widget.imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: widget.imageUrl!,
                          fit: BoxFit.cover,
                          width: widget.size ?? double.infinity,
                          height: widget.size,
                        ),
                      )
                    : DottedBorder(
                        color: AppColors.lightBlue,
                        strokeWidth: 1,
                        dashPattern: const [10, 6],
                        radius: const Radius.circular(4),
                        borderType: BorderType.RRect,
                        padding: const EdgeInsets.all(12),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                context.localization.noImageSelected,
                                style: context.theme.appTextTheme.body3.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.lightBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
