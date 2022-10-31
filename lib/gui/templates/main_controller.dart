import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_test/core/api/user_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_test/core/provider/user_provider.dart';
import 'package:app_test/data/models/user_model/user_model.dart';

class MainController {
  late PageController pageController;

  //APIS
  final UserApi _userApi = UserApi();

  //Providers
  late UserProvider _userProvider;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription<DocumentSnapshot<UserModel>>? streamUser;

  static final MainController _singleton = MainController._();
  factory MainController(BuildContext context) => _singleton._instance(context);
  MainController._();

  MainController _instance(BuildContext context) {
    _singleton._userProvider = context.read<UserProvider>();
    return _singleton;
  }

  void init() {
    pageController = PageController();
    getUser();
  }

  void getUser() {
    _userApi.getUserStream(_auth.currentUser!.uid).then((stream) {
      if (stream != null) {
        streamUser = stream.listen(
          (user) {
            final UserModel? currentUser = user.data();
            _userProvider.user =
                currentUser?.copyWith(reference: user.reference);
          },
        );
      }
    });
  }

  void dispose() {
    streamUser?.cancel();
    pageController.dispose();
  }
}
