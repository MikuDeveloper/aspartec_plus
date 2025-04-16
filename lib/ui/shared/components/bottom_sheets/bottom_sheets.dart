import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/screens/home/components/advice_rating_student.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' show ImageSource;

import 'select_image_source_bottom_sheet.dart';

class BottomSheets {
  const BottomSheets._();

  static void openBottomSheet(BuildContext context, Widget bottomSheet, [bool isDismissible = false]) => showModalBottomSheet(
      isDismissible: isDismissible,
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

  static Future<double?> openRatingBottomSheet(BuildContext context, [isDismissible = false]) async => showModalBottomSheet(
      isDismissible: isDismissible,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      useRootNavigator: true,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(
          left: defaultPadding * 2,
          right: defaultPadding * 2,
          bottom: defaultPadding * 3
        ),
        child: AdviceRatingStudent(),
      )
    );
}