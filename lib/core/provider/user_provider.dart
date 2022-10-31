import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app_test/data/models/user_model/user_model.dart';
import 'package:app_test/data/models/addres_model/address_model.dart';

class UserProvider with ChangeNotifier {
  User? _userAuth;
  UserModel? _user;
  String _textInput = '';
  AddressModel? _selectedAddress;
  LatLng? _currentPosition;

  User? get userAuth => _userAuth;

  set userAuth(User? userAuth) {
    _userAuth = userAuth;
    notifyListeners();
  }

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  String get textInput => _textInput;

  set textInput(String? textInput) {
    _textInput = textInput ?? '';
    notifyListeners();
  }

  LatLng? get currentPosition => _currentPosition;

  set currentPosition(LatLng? currentPosition) {
    _currentPosition = currentPosition;
    notifyListeners();
  }

  AddressModel? get selectedAddress => _selectedAddress;

  set selectedAddress(AddressModel? selectedAddress) {
    _selectedAddress = selectedAddress;
    notifyListeners();
  }
}
