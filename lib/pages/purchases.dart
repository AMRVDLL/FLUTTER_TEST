import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

import '../providers/iap_util.dart';

class PurchasePage extends StatelessWidget{
  const PurchasePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    revenueCatTestInit();
    return Scaffold(
      appBar: AppBar(
        title: const Text("View"),
      ),
      body: Row(children: [
        ElevatedButton(onPressed: 
      ()=>InAppPurchaseUtility.inAppPurchaseUtilityInstance.purchaseConsumableProduct("subs2"),
      child: const Text("Purchase Consumable")),
      ElevatedButton(onPressed: ()=>RevenueCatUI.presentPaywall(), child: const Text("RevCat"))
      ],)

    );
  }

  Future<void> revenueCatTestInit() async{
    await Purchases.setDebugLogsEnabled(true);
    if(!await Purchases.isConfigured){
      PurchasesConfiguration configuration= PurchasesConfiguration("goog_DhqdFOUEguFuDBFfgvRNUKocRCP");
      await Purchases.configure(configuration);
    }
    //Purchases.close() para cerrar la suscripción al servicio. Implementable en una StatefulWidget en el estado de salida
  }

}

