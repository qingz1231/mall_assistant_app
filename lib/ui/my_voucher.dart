import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/entity/ClaimedVoucher.dart';
import 'package:mall_assistant_app/service/claimedVoucher_service.dart';
import 'package:mall_assistant_app/ui/splash_screen.dart';
import 'package:mall_assistant_app/utils/navs_bars/title_appBar.dart';
import 'package:mall_assistant_app/utils/voucher_container.dart';

import '../entity/Voucher.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/title_desc.dart';

class MyVoucher extends StatefulWidget {
  const MyVoucher({Key? key}) : super(key: key);

  @override
  _MyVoucherState createState() => _MyVoucherState();
}

class _MyVoucherState extends State<MyVoucher> {
  late Future<List<Voucher>> claimedVouchers;
  @override
  void initState() {
    super.initState();
    // Delay the loading of data for 2 seconds
    claimedVouchers = Future.delayed(Duration(seconds: 1), () {
      return ClaimedVoucherService.getAllClaimed();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
  
        body: FutureBuilder(
        future: claimedVouchers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                     VoucherContainer(
                      title: snapshot.data![i].voucherName!, 
                     description: snapshot.data![i].voucherDesc!,
                     expiry: snapshot.data![i].dateEnd!.toString(),
                     id:snapshot.data![i].voucherId!
                     ),
                ],
              ),
            );
          } else {
            // Handle other states
            return SplashScreen();
          }
        },
      ),
        appBar: TitleAppBar(myVoucher, context),

          // VoucherContainer(title: "name", description: "shop",expiry: "expirity date",),
                // VoucherContainer(title: "name", description: "shop",expiry: "expirity date",),
                // VoucherContainer(title: "name", description: "shop",expiry: "expirity date",),
                // VoucherContainer(title: "name", description: "shop",expiry: "expirity date",),
                // VoucherContainer(title: "name", description: "shop",expiry: "expirity date",),

   

      );
  }
}