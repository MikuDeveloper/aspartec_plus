import 'dart:typed_data' show Uint8List;

import 'package:firebase_auth/firebase_auth.dart' show User, UserCredential;

import '../models/aspartec_user.dart';
import '../repositories/aspartec_user_repository.dart';

class AspartecUserUseCase {
  final AspartecUserRepository _aspartecUserRepository;

  AspartecUserUseCase(this._aspartecUserRepository);

  User? get currentUser => _aspartecUserRepository.currentUser;

  Future<UserCredential> registerAccount({required String email, required String password}) 
    => _aspartecUserRepository.registerAccount(email: email, password: password);
  Future<UserCredential> login({required String email, required String password})
    => _aspartecUserRepository.login(email: email, password: password);
  Future<void> logout() => _aspartecUserRepository.logout();
  Future<void> deleteAccount({required String email, required String password})
    => _aspartecUserRepository.deleteAccount(password: password);

  Future<void> changePassword({required String oldPassword, required String newPassword})
    => _aspartecUserRepository.changePassword(oldPassword: oldPassword, newPassword: newPassword);
  Future<void> resetPassword({required String email}) => _aspartecUserRepository.resetPassword(email: email);

  Future<void> registerData({required AspartecUser aspartecUser}) 
    => _aspartecUserRepository.registerData(aspartecUser: aspartecUser);
  Future<AspartecUser> getData({String? id}) => _aspartecUserRepository.getData(id: id);

  Future<String> updateProfilePicture({required Uint8List picture})
    => _aspartecUserRepository.updateProfilePicture(picture: picture);
  Future<void> updatePersonalData({required Map<String, dynamic> personalData})
    => _aspartecUserRepository.updatePersonalData(personalData: personalData);
  Future<void> updateSchoolData({required Map<String, dynamic> schoolData})
    => _aspartecUserRepository.updateSchoolData(schoolData: schoolData);
}
