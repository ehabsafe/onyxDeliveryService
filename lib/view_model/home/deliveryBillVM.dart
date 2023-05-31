import 'package:flutter/material.dart';
import 'package:onyx/data/remote/response/apiResponse.dart';
import 'package:onyx/models/deliveryBill.dart';
import 'package:onyx/repository/deliveryBill/deliveryBillRepoImp.dart';
import 'package:onyx/utils/dbhelper.dart';


class DeliveryBillsVM extends ChangeNotifier {
  final _myRepo = DeliveryBillRepoImp();

  ApiResponse<AllDeliveryBills> deliveryBill = ApiResponse.loading();

  DBHelper db = DBHelper() ;

  late Future<List<DeliveryBill>> _dev ;
  Future<List<DeliveryBill>> get dev => _dev ;

  void _setDeliveryBill(ApiResponse<AllDeliveryBills> response) {
    print("MARAJ :: $response");
    deliveryBill = response;
    notifyListeners();
  }

  Future<void> fetchDeliveryBills() async {
    _setDeliveryBill(ApiResponse.loading());
    _myRepo
        .getDeliveryBills()
        .then((value) => _setDeliveryBill(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setDeliveryBill(ApiResponse.error(error.toString())));
  }

  Future<List<DeliveryBill>> getDataFromDb () async {
    _dev = db.getList();
    return _dev ;
  }

}
