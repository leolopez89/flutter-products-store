import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_products_store/core/services.dart';
import 'package:flutter_products_store/main.dart';
import 'package:flutter_products_store/presentation/login/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    prepareApp();
    registerServices();
  });

  testWidgets('Login page, show required field', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(LoginPage), findsOneWidget);

    await tester.tap(find.byKey(const Key("login")));
    await tester.pump();

    expect(find.text("Required field"), findsNWidgets(2));
  });
}
