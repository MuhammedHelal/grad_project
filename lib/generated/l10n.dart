// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With Google`
  String get googleSignIn {
    return Intl.message(
      'Sign In With Google',
      name: 'googleSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up With Google`
  String get googleSignUp {
    return Intl.message(
      'Sign Up With Google',
      name: 'googleSignUp',
      desc: '',
      args: [],
    );
  }

  /// `I agree to `
  String get formIAgreeTo {
    return Intl.message(
      'I agree to ',
      name: 'formIAgreeTo',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Condions`
  String get formTermsAndContions {
    return Intl.message(
      'Terms and Condions',
      name: 'formTermsAndContions',
      desc: '',
      args: [],
    );
  }

  /// `This is a required field`
  String get requiredField {
    return Intl.message(
      'This is a required field',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Add Title Here`
  String get loginTitle {
    return Intl.message(
      'Add Title Here',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add subtitle here`
  String get loginSubtitle {
    return Intl.message(
      'Add subtitle here',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an Account? `
  String get donotHaveAccount {
    return Intl.message(
      'Don`t have an Account? ',
      name: 'donotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email Address`
  String get enterEmail {
    return Intl.message(
      'Enter Your Email Address',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Call Support`
  String get callSupport {
    return Intl.message(
      'Call Support',
      name: 'callSupport',
      desc: '',
      args: [],
    );
  }

  /// `Send message to customer services.`
  String get callCustomerService {
    return Intl.message(
      'Send message to customer services.',
      name: 'callCustomerService',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get enterName {
    return Intl.message(
      'Enter Your Name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Send via email address securely.`
  String get sendViaEmailAddress {
    return Intl.message(
      'Send via email address securely.',
      name: 'sendViaEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Type your email and click the button bellow, If there is a user rekated to this email address we will send you a message with link to reset the password`
  String get typeYourEmailAndClickTheButton {
    return Intl.message(
      'Type your email and click the button bellow, If there is a user rekated to this email address we will send you a message with link to reset the password',
      name: 'typeYourEmailAndClickTheButton',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Have an Account? `
  String get haveAnAccount {
    return Intl.message(
      'Have an Account? ',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get enterPhone {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password? `
  String get forgetPassword {
    return Intl.message(
      'Forget Password? ',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification sent successfully`
  String get verifyAcc {
    return Intl.message(
      'Email Verification sent successfully',
      name: 'verifyAcc',
      desc: '',
      args: [],
    );
  }

  /// `Please Verify Your Email Address`
  String get pleaseVerifyAcc {
    return Intl.message(
      'Please Verify Your Email Address',
      name: 'pleaseVerifyAcc',
      desc: '',
      args: [],
    );
  }

  /// `Use My Email Address`
  String get forgetPassSendEmail {
    return Intl.message(
      'Use My Email Address',
      name: 'forgetPassSendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Call Support`
  String get forgetPassCallSupport {
    return Intl.message(
      'Call Support',
      name: 'forgetPassCallSupport',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get forgetPasswordScreenTitle {
    return Intl.message(
      'Reset Password',
      name: 'forgetPasswordScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select which method you'd like to use.`
  String get forgetPasswordScreenSubTitle {
    return Intl.message(
      'Select which method you`d like to use.',
      name: 'forgetPasswordScreenSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send reset password link`
  String get sendEmailResetPassword {
    return Intl.message(
      'Send reset password link',
      name: 'sendEmailResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Go to your email inbox `
  String get emailResetPasswordDetails {
    return Intl.message(
      'Go to your email inbox ',
      name: 'emailResetPasswordDetails',
      desc: '',
      args: [],
    );
  }

  /// `Sent reset link successfully`
  String get sentResetLinkSuccess {
    return Intl.message(
      'Sent reset link successfully',
      name: 'sentResetLinkSuccess',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
