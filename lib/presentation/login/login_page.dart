import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/core/validators.dart';
import 'package:flutter_products_store/application/login/login_controller.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';
import 'package:flutter_products_store/presentation/core/widgets/template_button.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  Future _loginCheck() async => await controller.login();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.12),
            const SizedBox(
              width: 76,
              child: Image(
                  fit: BoxFit.contain, image: AssetImage("assets/logo.png")),
            ),
            SizedBox(height: size.height * 0.12),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Form(
                  key: _.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        key: const Key('email'),
                        controller: _.emailController,
                        decoration: fieldDecoration(
                          hintText: 'Email',
                          mode: BorderMode.top,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              'assets/pass.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        validator: emailValidator,
                        onFieldSubmitted: (value) => _loginCheck(),
                        textInputAction: TextInputAction.done,
                      ),
                      TextFormField(
                        key: const Key('password'),
                        controller: _.passwordController,
                        obscureText: true,
                        decoration: fieldDecoration(
                          hintText: 'Password',
                          mode: _.isLogin ? BorderMode.end : BorderMode.center,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              'assets/key.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        validator: nameValidator,
                        onFieldSubmitted: (value) => _loginCheck(),
                        textInputAction: TextInputAction.done,
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(microseconds: 10),
                        child: _.isLogin
                            ? Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextButton(
                                  onPressed: _.forgotPassword,
                                  child: const Text("Forgot your password?",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ),
                              )
                            : TextFormField(
                                key: const Key('repeat'),
                                controller: _.repeatPassController,
                                obscureText: true,
                                decoration: fieldDecoration(
                                  hintText: 'Repeat Password',
                                  mode: BorderMode.end,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Image.asset(
                                      'assets/key.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                                validator: _.passwordValidator,
                                onFieldSubmitted: (value) => _loginCheck(),
                                textInputAction: TextInputAction.done,
                              ),
                      ),
                      const Spacer(),
                      Center(
                        child: TemplateButton(
                          title: _.isLogin ? 'Login' : 'Sign Up',
                          key: const Key("login"),
                          onPressed: _loginCheck,
                          loading: _.loading,
                        ),
                      ),
                      const SizedBox(height: 24),
                      RichText(
                        textAlign: TextAlign.center,
                        key: const Key("accoutLine"),
                        text: TextSpan(
                          text: _.isLogin
                              ? 'Don´t have an account? '
                              : 'Already have an account? ',
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: _.isLogin ? 'Sign Up' : 'Log in',
                                style:
                                    const TextStyle(color: AppColors.mainColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _.switchLoginRegister()),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.09),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
