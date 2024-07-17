import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/themes/app_theme.dart';

class GIconButton extends StatelessWidget {
  double width;
  double height;
  String text;
  String iconPath;
  Function() onPressed;
  bool loading;
  GIconButton({
    this.width = double.infinity,
    this.height = 58,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.loading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPressed,
      child: Container(
        height: height.h,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.primaryColor)),
        child: !loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(iconPath),
                  Gap(12.r),
                  Text(text),
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
      ),
    );
  }
}
