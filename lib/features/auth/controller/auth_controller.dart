
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample1/features/auth/repository/auth_repository.dart';
import 'package:riverpod_sample1/models/user_model.dart';
import '../../../utils.dart';

final userProvider=StateProvider<UserModel?>((ref) => null);

final authControllerProvider = Provider(
    (ref) => AuthController(authRepository: ref.read(authRepositoryProvider), ref:ref ));

class AuthController extends StateNotifier<bool>{
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository,required Ref ref})
      : _authRepository = authRepository,_ref=ref,super(false);

  void signInWithGoogle(BuildContext context)async {
    state=true;
    final user=await _authRepository.signInWithGoogle();
    state=false;
    user.fold((l) => showSnackbar(context,l.message), (userModel) => _ref.read(userProvider.notifier).update((state) => userModel));
  }
}
