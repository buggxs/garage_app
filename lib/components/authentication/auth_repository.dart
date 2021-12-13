class AuthRepository {

  Future<String> attemptAutoLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'abc';
  }

  Future<String> login({
    required String username,
    required String password
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    return 'abc';
  }

  Future<void> signUp({
    required String username,
    required String password,
    required String email
  }) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<String> confirmationSignUp({
    required String username,
    required String confirmationCode,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    return 'abc';
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}