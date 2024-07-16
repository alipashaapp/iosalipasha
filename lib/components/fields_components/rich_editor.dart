import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../helpers/colors.dart';
import '../../helpers/style.dart';

class RichEditor extends StatelessWidget {
   RichEditor({super.key,required this.controller});
final QuillEditorController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToolBar(
          controller:controller,
          toolBarColor: GrayDarkColor,
          toolBarConfig: [
            ToolBarStyle.headerOne,
            ToolBarStyle.bold,
            ToolBarStyle.italic,
            ToolBarStyle.clean,
            ToolBarStyle.link,
            ToolBarStyle.addTable,
            ToolBarStyle.editTable,
            ToolBarStyle.blockQuote,
            ToolBarStyle.align,
            ToolBarStyle.color,
            ToolBarStyle.background,
            ToolBarStyle.listBullet,
            ToolBarStyle.listOrdered,
            ToolBarStyle.redo,
            ToolBarStyle.undo,
            ToolBarStyle.directionLtr,
            ToolBarStyle.directionRtl,
          ],
        ),
        QuillHtmlEditor(
          padding: EdgeInsets.symmetric(horizontal: 0.005.sw),
          controller: controller,
          hintText: 'أدخل الوصف',
          hintTextStyle: HintTextStyle,
          hintTextAlign: TextAlign.right,
          textStyle: InputTextStyle,
          minHeight: 0.3.sh,
        ),
      ],
    );
  }
}
