import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivent/themes/app_theme.dart';

class GMainButton extends StatelessWidget {
  double width;
  String text;
  Function() onPressed;
  bool loading;
  Color color;

  GMainButton({
    this.width = double.infinity,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.color = const Color(0xFF56C596),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
        ),
        child: !loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 90.0.r),
                        child: AutoSizeText(
                          text,
                          presetFontSizes: [15.sp, 16.sp],
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundColor: AppColors.orangeColor,
                      child: const Icon(
                        Icons.arrow_back,
                        textDirection: TextDirection.rtl,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              ),
      ),
    );
  }
}

class GSecondaryButton extends StatelessWidget {
  double width;
  double height;

  String text;
  Function() onPressed;
  bool loading;
  Color color;

  GSecondaryButton({
    this.width = double.infinity,
    this.height = double.infinity,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.color = const Color(0xFF56C596),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: !loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              ),
      ),
    );
  }
}
