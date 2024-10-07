import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseUtility{
  InAppPurchaseUtility._();
  static final InAppPurchaseUtility _instance= InAppPurchaseUtility._();
  static InAppPurchaseUtility get inAppPurchaseUtilityInstance => _instance;
  final InAppPurchase _iap = InAppPurchase.instance;

  late StreamSubscription<List<PurchaseDetails>> _purchaseSubscription;

  Future<void> update() async{
    if(!await _iap.isAvailable()) return;
    _purchaseSubscription = InAppPurchase.instance.purchaseStream.listen((List<PurchaseDetails> purchaseDetailsList){
      handlePurchaseUpdates(purchaseDetailsList);
    },onDone: (){
      _purchaseSubscription.cancel();
    });
  }

  Future<void> handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) async{

  }

  Future<void> _purchaseGeneric(String id, Future<bool> Function({required PurchaseParam purchaseParam}) buy) async{
    if(!await _iap.isAvailable())return;
    Set<String> prodIds={id};
    final ProductDetailsResponse response = await _iap.queryProductDetails(prodIds);
    if(response.error!=null || response.productDetails.isEmpty)return;
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: response.productDetails.first);
    await buy(purchaseParam: purchaseParam);
  }

  Future<void> purchaseConsumableProduct(String productId) async{
    await _purchaseGeneric(productId, _iap.buyConsumable);
  }

  Future<void> purchaseNonConsumableProduct(String productId) async{
    await _purchaseGeneric(productId, _iap.buyNonConsumable);
  }
  restorePurchases() async{
    try{
      await _iap.restorePurchases();
    }catch(e){}
  }
}