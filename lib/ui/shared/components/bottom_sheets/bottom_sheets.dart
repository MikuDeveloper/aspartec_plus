import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/shared/components/bottom_sheets/select_image_source_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' show ImageSource;

class BottomSheets {
  const BottomSheets._();

  static void openBottomSheet(BuildContext context, Widget bottomSheet) => showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      useRootNavigator: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + defaultPadding
        ),
        child: bottomSheet
      )
    );

  static Future<ImageSource?> openImageSourceBottomSheet(BuildContext context) async => showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    useRootNavigator: true,
    context: context,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + defaultPadding
      ),
      child: const SelectImageSourceBottomSheet(),
    )
  );
}