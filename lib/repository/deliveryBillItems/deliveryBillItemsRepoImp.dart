import 'package:onyx/data/remote/network/apiEndPoints.dart';
import 'package:onyx/data/remote/network/baseApiService.dart';
import 'package:onyx/data/remote/network/networkApiService.dart';
import 'package:onyx/models/deliveryBillItems.dart';
import 'package:onyx/repository/deliveryBillItems/deliveryBillItemsRepo.dart';

class DeliveryBillItemsRepoImp implements DeliveryBillItemsRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<DeliveryBillsDetails?> getDeliveryBillsDetails(String billsrl) async {
    try {
      dynamic response =
          await _apiService.getDetailsResponse(ApiEndPoints().getDeliveryBillsItems,billsrl);
      final jsonData = DeliveryBillsDetails.fromJson(response);
      print("MARAJ $jsonData");
      return jsonData;
    } catch (e) {
      print("MARAJ-E $e}");
      throw e;
    }
  }
}
