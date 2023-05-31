import 'package:flutter/material.dart';
import 'package:onyx/data/remote/response/apiResponse.dart';
import 'package:onyx/models/deliveryBillItems.dart';
import 'package:onyx/repository/deliveryBillItems/deliveryBillItemsRepoImp.dart';

class DeliveryBillItemsVM extends ChangeNotifier {
  final _myRepo = DeliveryBillItemsRepoImp();

  ApiResponse<DeliveryBillsDetails> deliveryBill = ApiResponse.loading();

  void _setDeliveryBillItems(ApiResponse<DeliveryBillsDetails> response) {
    print("MARAJ :: $response");
    deliveryBill = response;
    notifyListeners();
  }

  Future<void> fetchDeliveryBills(String billsrl) async {
    _setDeliveryBillItems(ApiResponse.loading());
    _myRepo
        .getDeliveryBillsDetails(billsrl)
        .then((value) => _setDeliveryBillItems(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setDeliveryBillItems(ApiResponse.error(error.toString())));
  }
}
