import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/service/voucher_service.dart';
import 'package:mall_assistant_app/utils/navs_bars/title_appBar.dart';
import 'package:mall_assistant_app/utils/voucher_container.dart';

import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/title_desc.dart';

class MallVoucher extends StatelessWidget {
  const MallVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: VoucherService.getVouchers('1') ,
      builder: (context, snapshot) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i = 0;i < snapshot.data!.length;i++)
                     VoucherContainer(
                      title: snapshot.data![i].voucherName!, 
                     description: snapshot.data![i].voucherDesc!,
                     expiry: snapshot.data![i].dateEnd!.toString(),
                     id:snapshot.data![i].voucherId!
                     ),
                
                  ],
                ),
              ),
        ),
      ),
    );
  }
}