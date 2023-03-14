import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_products_store/core/services.dart';
import 'package:flutter_products_store/presentation/core/navigation/navigation.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await prepareApp();
  registerServices();

  runApp(const MyApp());
}

Future<void> prepareApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['assets/fonts'], license);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Products App',
      initialRoute: Routes.getInitialRoute,
      getPages: appRoutes,
      theme: ThemeData(fontFamily: "Inter"),
    );
  }
}
