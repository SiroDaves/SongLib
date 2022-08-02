import 'package:flutter/material.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/navigator/mixin/error_navigator.dart';
import 'package:songlib/navigator/route_names.dart';
import 'package:songlib/styles/theme_dimens.dart';
import 'package:songlib/util/keys.dart';
import 'package:songlib/viewmodel/login/login_viewmodel.dart';
import 'package:songlib/widget/general/status_bar.dart';
import 'package:songlib/widget/general/styled/myapp_button.dart';
import 'package:songlib/widget/general/styled/myapp_input_field.dart';
import 'package:songlib/widget/general/styled/myapp_progress_indicator.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = RouteNames.loginScreen;

  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

@visibleForTesting
class LoginScreenState extends State<LoginScreen> with ErrorNavigatorMixin implements LoginNavigator {
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return ProviderWidget<LoginViewModel>(
      create: () => GetIt.I()..init(this),
      childBuilder: (context, theme, _) => Consumer<LoginViewModel>(
        builder: (context, viewModel, child) => StatusBar.animated(
          isDarkStyle: (brightness != Brightness.dark),
          child: Scaffold(
            backgroundColor: theme.colorsTheme.background,
            body: SafeArea(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                child: Column(
                  children: [
                    Container(height: ThemeDimens.padding16),
                    Text(
                      'Login',
                      style: theme.coreTextTheme.titleNormal,
                      textAlign: TextAlign.center,
                    ),
                    Container(height: ThemeDimens.padding32),
                    Text(
                      'Just fill in some text. There is no validator for the login',
                      style: theme.coreTextTheme.labelButtonSmall,
                    ),
                    Container(height: ThemeDimens.padding32),
                    MyappInputField(
                      key: Keys.emailInput,
                      enabled: !viewModel.isLoading,
                      onChanged: viewModel.onEmailUpdated,
                      hint: 'Email',
                    ),
                    Container(height: ThemeDimens.padding16),
                    MyappInputField(
                      key: Keys.passwordInput,
                      enabled: !viewModel.isLoading,
                      onChanged: viewModel.onPasswordUpdated,
                      hint: 'Password',
                    ),
                    Container(height: ThemeDimens.padding16),
                    if (viewModel.isLoading) ...{
                      const MyappProgressIndicator.light(),
                    } else
                      MyappButton(
                        key: Keys.loginButton,
                        isEnabled: viewModel.isLoginEnabled,
                        text: 'Login',
                        onClick: viewModel.onLoginClicked,
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

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();
}
