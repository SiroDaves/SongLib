import 'dart:async';

import 'package:flutter/material.dart';

import '../exports.dart';

/// You must call the "show()" method to view the alert class you have defined.
class Alert {
  final String? id;
  final BuildContext? context;
  final AlertType? type;
  final AlertStyle? style;
  final String? alertTitle;
  final String? alertMessage;
  final Widget? alertWidget;
  final List<AlertButton>? buttons;
  final Function? closeFunction;
  final Widget? closeIcon;
  final bool? onWillPopActive;
  final bool? useRootNavigator;
  final AlertAnimation? alertAnimation;

  /// Alert constructor
  ///
  /// [context], [title] are required.
  Alert({
    this.context,
    this.id,
    this.type,
    this.style = const AlertStyle(),
    this.alertTitle,
    this.alertMessage,
    this.alertWidget,
    this.buttons,
    this.closeFunction,
    this.closeIcon,
    this.onWillPopActive = false,
    this.alertAnimation,
    this.useRootNavigator = true,
  });

  /// Displays defined alert window
  Future<bool?> show() async {
    return await showGeneralDialog(
        context: context!,
        pageBuilder: (BuildContext? buildContext, Animation<double>? animation,
            Animation<double>? secondaryAnimation) {
          return _buildDialog();
        },
        barrierDismissible: style!.isOverlayTapDismiss,
        barrierLabel:
            MaterialLocalizations.of(context!).modalBarrierDismissLabel,
        barrierColor: style!.overlayColor,
        useRootNavigator: useRootNavigator!,
        transitionDuration: style!.animationDuration,
        transitionBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            alertAnimation == null
                ? _showAnimation(animation, secondaryAnimation, child)
                : alertAnimation!(
                    context, animation, secondaryAnimation, child));
  }

  /// Dismisses the alert dialog.
  Future<void> dismiss() async {
    Navigator.of(context!, rootNavigator: useRootNavigator!).pop();
  }

  /// Alert dialog content widget
  Widget _buildDialog() {
    final Widget _child = ConstrainedBox(
      constraints: style!.constraints ??
          BoxConstraints.expand(
              width: double.infinity, height: double.infinity),
      child: Align(
        alignment: style!.alertAlignment,
        child: SingleChildScrollView(
          child: AlertDialog(
            title: Container(
              child: Text(alertTitle!, style: style!.titleStyle),
            ),
            content: Container(
              height: style!.alertHeight,
              width: double.maxFinite,
              child: alertMessage != null
                  ? Text(
                      alertMessage!,
                      style: style!.descStyle,
                      textAlign: style!.descTextAlign,
                    )
                  : alertWidget,
            ),
            actions: _getButtons(),
          ),
        ),
      ),
    );
    return onWillPopActive!
        ? WillPopScope(onWillPop: () async => false, child: _child)
        : _child;
  }

  /// Returns defined buttons. Default: Cancel Button
  List<Widget> _getButtons() {
    List<Widget> actionButtons = [];
    if (style!.isButtonVisible) {
      if (buttons != null) {
        buttons!.forEach(
          (button) {
            if ((button.width != null && buttons!.length == 1) ||
                style!.buttonsDirection == ButtonsDirection.column) {
              actionButtons.add(button);
            } else
              actionButtons.add(button);
          },
        );
      } else {
        Widget cancelButton = AlertButton(
          text: "CANCEL",
          onPressed: () => Navigator.pop(context!), key: null,
        );
        if (style!.buttonsDirection == ButtonsDirection.row) {
          cancelButton = Expanded(
            child: cancelButton,
          );
        }
        actionButtons.add(cancelButton);
      }
    }
    return actionButtons;
  }

  /// Shows alert with selected animation
  _showAnimation(animation, secondaryAnimation, child) {
    switch (style!.animationType) {
      case AnimationType.fromRight:
        return AnimationTransition.fromRight(
            animation, secondaryAnimation, child);
      case AnimationType.fromLeft:
        return AnimationTransition.fromLeft(
            animation, secondaryAnimation, child);
      case AnimationType.fromBottom:
        return AnimationTransition.fromBottom(
            animation, secondaryAnimation, child);
      case AnimationType.grow:
        return AnimationTransition.grow(animation, secondaryAnimation, child);
      case AnimationType.shrink:
        return AnimationTransition.shrink(animation, secondaryAnimation, child);
      case AnimationType.fromTop:
        return AnimationTransition.fromTop(
            animation, secondaryAnimation, child);
    }
  }
}
