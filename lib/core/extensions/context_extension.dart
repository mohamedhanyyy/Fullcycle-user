import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CurrentLang on BuildContext {
  // bool get isCurrentEnglish => locale == const Locale('en');

  EdgeInsets get bottomInsetsAndAllPadding => EdgeInsets.only(
      bottom: MediaQuery.of(this).viewInsets.bottom,
      left: 20,
      right: 20,
      top: 20);

  EdgeInsets get bottomInsetsPadding =>
      EdgeInsets.only(bottom: MediaQuery.of(this).viewInsets.bottom);

  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: 20.w);
}

extension ToColorFilter on Color {
  ColorFilter? get toColorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
