import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/home/home_controller.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';
import 'package:flutter_products_store/presentation/core/widgets/template_button.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.14),
            const SizedBox(
              width: 76,
              child: Image(
                  fit: BoxFit.contain, image: AssetImage("assets/logo.png")),
            ),
            SizedBox(height: size.height * 0.14),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: TemplateButton(
                        title: 'Logout',
                        key: const Key("login"),
                        onPressed: _.logout,
                        loading: _.loading,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
