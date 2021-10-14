import 'package:bongalo_recruitment/auth/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("The Username is required", (tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    Finder submit = find.widgetWithText(Container, "Register");
    await tester.tap(submit);
    await tester.pump();

    expect(find.text("Username is required"), findsOneWidget);
  });

  testWidgets(
      'Given a password, when it doesn\'t contain at least one uppercase letter then the validator will fails',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    final Finder password = find.widgetWithText(TextFormField, "Password");
    final Finder submit = find.widgetWithText(Container, 'Register');
    await tester.enterText(password, "secret");
    await tester.tap(submit);
    await tester.pump();
    expect(find.text("One uppercase letter"), findsOneWidget);
  });

  testWidgets(
      'Given a password with a Uppercase letter, when it doesn\'t contain at least one lowercase letter the validator will fails',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    final Finder password = find.widgetWithText(TextFormField, "Password");
    final Finder submit = find.widgetWithText(Container, 'Register');
    await tester.enterText(password, "SECRET");
    await tester.tap(submit);
    await tester.pump();

    expect(find.text("One lowercase letter"), findsOneWidget);
  });

  testWidgets(
      'Given a password with a Uppercase letter, lowecase letter, when the length <8 then the validator will fails',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    final Finder password = find.widgetWithText(TextFormField, "Password");
    final Finder submit = find.widgetWithText(Container, 'Register');
    await tester.enterText(password, "Secret");
    await tester.tap(submit);
    await tester.pump();

    expect(
        find.text("Minimum password length of 8 characters"), findsOneWidget);
  });

  testWidgets(
      'Given a password of 8 character min with a Uppercase letter, lowecase letter, when it doesn\'t contain at 2 specials characters the validator will fails',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    final Finder password = find.widgetWithText(TextFormField, "Password");
    final Finder submit = find.widgetWithText(Container, 'Register');
    await tester.enterText(password, "Secretdepau");
    await tester.tap(submit);
    await tester.pump();

    expect(find.text("Two special characters"), findsOneWidget);
  });

  testWidgets(
      'Given a password of 8 character min with a Uppercase letter, lowecase letter and at least two specials characters when it  contain the username string the validator will fails',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    final Finder username = find.widgetWithText(TextFormField, "Username");
    final Finder password = find.widgetWithText(TextFormField, "Password");
    final Finder submit = find.widgetWithText(Container, 'Register');

    await tester.enterText(username, "geek");
    await tester.enterText(password, "Secretgeek@#");
    await tester.tap(submit);
    await tester.pump();

    expect(
        find.text("Password should not contain the username"), findsOneWidget);
  });
}
