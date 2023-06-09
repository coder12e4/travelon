

import 'package:flutter/material.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../Utils/colors.dart';
import 'fixdride_button.dart';

class fixdrideAlertView extends StatelessWidget {
  final AlertType? alertType;
  final String? cancelButtonText, okButtonText, message, title;
  final Function? okButtonCallBack, cancelButtonCallBack;
  final BuildContext? alertContext;
  final Color? color;
  const fixdrideAlertView(
      {Key? key,
      this.alertType,
      this.cancelButtonText = null,
      this.okButtonText,
      this.message,
      this.title,
      this.okButtonCallBack,
      this.cancelButtonCallBack,
      this.alertContext,
      this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 65,
                  width: 65,
                  child: Center(
                    child: imageName(),
                  ),
                  decoration: BoxDecoration(
                      color: imageBgColor(), shape: BoxShape.circle)),
              SizedBox(
                height: 15,
              ),
              txtExt(
                text: title,
                fontColor: iconColor(),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              txtExt(
                text: message,
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (cancelButtonText != null)
                            Expanded(
                                child: fixdrideButton(
                                    height: 40,
                                    gradient:
                                         Constants.alertButtonGreyGradient,
                                    title: cancelButtonText,
                                    onPressed: () {
                                      Navigator.pop(alertContext!);
                                      cancelButtonCallBack!();
                                    })),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: fixdrideButton(
                                  cornerRadius:
                                      cancelButtonText != null ? 0 : 5,
                                  height: 40,
                                  gradient:
                                       Constants.alertButtonOrangeGradient,
                                  title: okButtonText,
                                  onPressed: () {
                                    Navigator.pop(alertContext!);
                                 //   okButtonCallBack!();
                                  }))
                        ],
                      )))
            ],
          ),
        ));
  }

  Icon? imageName() {
    var icon;
    switch (alertType!) {
      case AlertType.error:
        icon = Icon(
          Icons.close,
          color:  Constants.ErrorIconColor,
        );
        break;
      case AlertType.success:
        icon = Icon(
          Icons.check,
          color:  Constants.SuccessIconColor,
        );
        break;
      case AlertType.warning:
        icon = Icon(
          Icons.error_outline,
          color:  Constants.ErrorIconColor,
        );
        break;
    }
    return icon;
  }

  Color? imageBgColor() {
    var color;
    switch (alertType!) {
      case AlertType.error:
        color =  Constants.ErrorAlertImageBGColor;
        break;
      case AlertType.success:
        color =  Constants.SuccessAlertImageBGColor;
        break;
      case AlertType.warning:
        color =  Constants.ErrorAlertImageBGColor;
        break;
    }
    return color;
  }

  Color? iconColor() {
    var color;
    switch (alertType!) {
      case AlertType.error:
        color =  Constants.ErrorIconColor;
        break;
      case AlertType.success:
        color =  Constants.SuccessIconColor;
        break;
      case AlertType.warning:
        color =  Constants.ErrorIconColor;
        break;
    }
    return color;
  }
}

enum AlertType {
  error,
  success,
  warning,
}
