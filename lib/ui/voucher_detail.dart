import 'package:flutter/material.dart';
import 'package:mall_assistant_app/consts/consts.dart';
import 'package:mall_assistant_app/entity/Customer.dart';
import 'package:mall_assistant_app/service/claimedVoucher_service.dart';
import 'package:mall_assistant_app/service/voucher_service.dart';
import 'package:mall_assistant_app/user_preference.dart';
import 'package:mall_assistant_app/utils/customButton.dart';
import 'package:mall_assistant_app/utils/read_more.dart';
import '../utils/navs_bars/bottonNav.dart';
import '../utils/horizontalGridScroll.dart';
import '../utils/label_input.dart';
import '../utils/title_desc.dart';

class VoucherDetail extends StatefulWidget {
  final String voucherid;
  VoucherDetail({required this.voucherid});

  @override
  _VoucherDetailState createState() => _VoucherDetailState();
}

class _VoucherDetailState extends State<VoucherDetail> {
  bool claimed = false;
  Customer customer = Customer();

  Future<void> setExist(String voucherid) async {
    customer = await RememberUserPrefs.loadCurrentUser();

    bool saved = await ClaimedVoucherService.voucherIsSaved(
        voucherid, customer.customerId!);

    setState(() {
      claimed = saved;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setExist(widget.voucherid);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double functionHeight = screenHeight / 18;
    return SafeArea(
      //'https://mall-assistant-system.s3.amazonaws.com/adminLogin-bg.jpg

      child: FutureBuilder(
        future: VoucherService.getVoucherById(widget.voucherid),
        builder: (context, snapshot) => Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(height: screenHeight / 3, width: screenWidth),
                  Container(
                    height: screenHeight / 3,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://mall-assistant-system.s3.amazonaws.com/adminLogin-bg.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        snapshot.data!.dateEnd!.toString(),
                        style: TextStyle(color: txt2, fontSize: txt_small),
                      ),
                    ),
                    TitleDesc(
                      title: snapshot.data!.voucherName!,
                      description:
                          snapshot.data!.voucherCount!.toString() + ' left',
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            termsCondition,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                              child: ReadMore(snapshot.data!.voucherDesc!, 5,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400)))
                        ],
                      ),
                    ),
                    Container(
                        width: screenWidth,
                        padding: EdgeInsets.all(15),
                        child: !claimed
                            ? CustomRegularButton('Claim Voucher', bg_primary,
                                () {
                              
                                ClaimedVoucherService.save('1',
                                    customer.customerId!, widget.voucherid);
                                setState(() {
                                  claimed = true;
                                });
                              })
                            : CustomRegularButton(
                                'Claimed', border1, () => null))
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  /*
   
   */
}
