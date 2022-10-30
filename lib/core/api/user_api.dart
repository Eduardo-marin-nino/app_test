import 'package:app_test/data/models/user_model/user_model.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserApi {
  final Logger logger = Logger();
  final keyCollectionCreditCard = "paymentCards";
  final CollectionReference _firestore =
      FirebaseFirestore.instance.collection('users');

  Future<bool> createUser(UserModel user) async {
    try {
      await _firestore.doc(user.id).set(user.toJson());
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  Future<DocumentSnapshot<UserModel>?>? getUser(String id) async {
    try {
      return _firestore
          .doc(id)
          .withConverter<UserModel>(
              fromFirestore: (snapshot, _) =>
                  UserModel.fromJson(snapshot.data()!),
              toFirestore: (user, _) => user.toJson())
          .get();
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<Stream<DocumentSnapshot<UserModel>>?> getUserStream(String id) async {
    try {
      return _firestore
          .doc(id)
          .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          )
          .snapshots();
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<QuerySnapshot?> findFcmToken(String token) async {
    try {
      return _firestore.where("fcmToken", isEqualTo: token).get();
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<bool> updateUser(UserModel user) async {
    try {
      await _firestore.doc(user.id).update(user.toJson());
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  Future<bool> deleteCard(String user, String idPaymentCard) async {
    try {
      await _firestore
          .doc(user)
          .collection(keyCollectionCreditCard)
          .doc(idPaymentCard)
          .delete();
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
