import 'package:appwrite/appwrite.dart' as appwrite;
import 'package:appwrite/models.dart';
import 'package:flappwrite_water_tracker/app/model/user.dart';
import 'package:flappwrite_water_tracker/app/utils/app_constants.dart';

class ApiService {
  static ApiService? _instance;
  late final appwrite.Client _client;
  late final appwrite.Account _account;
  late final appwrite.Databases _db;

  ApiService._internal() {
    _client = appwrite.Client(endPoint: AppConstants.endpoint).setProject(
      AppConstants.project,
    );

    _account = appwrite.Account(_client);
    _db = appwrite.Databases(_client);
  }

  static ApiService get instance {
    _instance ??= ApiService._internal();
    return _instance!;
  }

  Future<Session> login({required email, required password}) async {
    return _account.createEmailSession(email: email, password: password);
  }

  Future<Account> signUp({
    String? name,
    required email,
    required password,
  }) async {
    return _account.create(
      userId: appwrite.ID.unique(),
      email: email,
      password: password,
      name: name,
    );
  }

  Future logout() {
    return _account.deleteSession(sessionId: 'current');
  }

  Future<User> getUser() async {
    final result = await _account.get();
    return User.fromMap(result.toMap());
  }
}
