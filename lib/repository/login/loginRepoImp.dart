import 'package:onyx/data/remote/network/apiEndPoints.dart';
import 'package:onyx/data/remote/network/baseApiService.dart';
import 'package:onyx/data/remote/network/networkApiService.dart';
import 'package:onyx/models/user.dart';
import 'package:onyx/repository/login/loginRepo.dart';

class LoginRepoImp implements LoginRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<User?> getUser(String userId, String password) async {
    try {
      dynamic response =  await _apiService.getResponseLogin(
          ApiEndPoints().login, userId, password);
      final jsonData = User.fromJson(response);

      return jsonData;
    } catch (e) {
      print("MARAJ-E $e}");
      throw e;
    }
  }
}
