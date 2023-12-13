import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Validator {
  final _email = BehaviorSubject<String>.seeded('@');
  final _password = BehaviorSubject<String>.seeded('');

  Stream<String> get email => _email.stream.transform(validateEmail);

  Sink<String> get sinkEmail => _email.sink;

  Stream<String> get password => _password.stream.transform(validatePassword);

  Sink<String> get sinkPassword => _password.sink;

  Stream<bool> get loginValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.length != 1) {
      isEmail(value)
          ? sink.add(value)
          : sink.add('Please Enter Valid Email !!');
    }
  });
  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      if (value.length < 8) {
        sink.add('Your Password must Be More Than Characters.');
      }
      isPassword(value)
          ? sink.add(value)
          : sink.add(
              'Your Password Must be Contains Uppercase and Lowercase and Be latin');
    }
  });

  static bool isEmail(String email) {
    String value =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(email);
  }

  static bool isPassword(String password) {
    String value = r'^(?=.*[a-z])(?=.*[A-Z])[A-Za-z]+$';
    RegExp regExp = RegExp(value);
    return regExp.hasMatch(password);
  }
  dispose() {
    _email.close();
    _password.close();
  }

}
final validation = Validator();