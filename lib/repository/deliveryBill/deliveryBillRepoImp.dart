import 'package:onyx/data/remote/network/apiEndPoints.dart';
import 'package:onyx/data/remote/network/baseApiService.dart';
import 'package:onyx/data/remote/network/networkApiService.dart';
import 'package:onyx/models/deliveryBill.dart';
import 'package:onyx/repository/deliveryBill/deliveryBillRepo.dart';

class DeliveryBillRepoImp implements DeliveryBillRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<AllDeliveryBills?> getDeliveryBills() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getDeliveryBillsItems);
      final jsonData = AllDeliveryBills.fromJson(response);
      print("MARAJ $jsonData");
      return jsonData;
    } catch (e) {
      print("MARAJ-E $e}");
      throw e;
    }
  }
}
