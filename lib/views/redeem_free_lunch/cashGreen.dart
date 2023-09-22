// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';

class CashGreen extends StatefulWidget {
  const CashGreen({super.key});


  @override
  State<CashGreen> createState() => _CashGreenState();
}

class _CashGreenState extends State<CashGreen> {

  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController= TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController numberOfLunchController = TextEditingController();

  // This line is just a test, it shoould be removed and replace with the api call
  List<String> bankD = ["Bank","First Bank", "Polaris", "UBA", "GTB"]; 

  @override
  void initState(){
    super.initState();
  }

  Widget inputDetail(String title){
    return Container(
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Opensans',
                  fontSize: 15,
                  // fontWeight: FontWeight.bold
                ),
              ),
              SizedBoxH(8),
              TextField(
                cursorColor: Colors.black, // Set the vertical pointer color to black
                // controller: body,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                )
              ),
            ],
          ),
        ),
      );
  }

  Widget inputBankDetail(String title, List<String> banks, String selectedBank) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: DropdownButtonFormField<String>(
          value: selectedBank,
          onChanged: (newValue) {
            // Handle bank selection here
            setState(() {
              selectedBank = newValue!;
            });
          },
          items: banks.map((bank) {
              return DropdownMenuItem(
                value: bank,
                child: Text(bank),
              );
            }
          ).toList(),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: title,
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }


  Widget SizedBoxH(double h){ 
    return SizedBox(
      height: h,
    );
  }

  Widget SimpleText(String title, TextAlign textAlign, double fontSize,  FontWeight? fontweight){
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Opensans',
        fontSize: fontSize,
        fontWeight: fontweight,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            // Left Arrow 
            Container(
              alignment: Alignment(-1.0,-1.0),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon:Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBoxH(10.0),
            SimpleText(
              'Redeem Free Lunch for Cash',
              TextAlign.center,
              20,
              FontWeight.bold
            ),
            SizedBoxH(10.0),
            SimpleText(
            'Each Free Lunch Voucher is worth \$5 Naira!',
            TextAlign.center,15.0, null
            ),
            SizedBoxH(10.0),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SimpleText(
                'Please enter your account details to redeem \$5  cash for one free lunch',
                TextAlign.justify,15.0,null
              ),
            ),
            SizedBoxH(20),
            inputDetail('Account Number'),
            inputDetail('Account Name'),
            inputBankDetail("Bank", bankD, "Bank"),
            inputDetail('Number of lunch you want to redeem'),
            const Spacer(),
            SizedBoxH(20),
            
            Container(
              padding: const EdgeInsets.all(20.0),
                width: 382,
                height: 90,
                child: AppButton(
                  height: 48, 
                  width: 382, 
                  buttonText: "Done", 
                  buttonTextColor: Colors.white, 
                  onTap: () {showDialog<String>(
                      barrierColor: Color.fromRGBO(49, 49, 49, 0.8),
                      context: context,
                      builder: (BuildContext context) =>
                    DialogueBox(
                      dialogIcon: 
                      Center(
                        child: 
                          SvgPicture.asset(
                            'images/vuesax-outline-tick-circle.svg',
                            height: 120,
                            width: 120,
                        ),
                      ), 
                      dialogText: Text("Successful"), 
                      dialogButton: 
                        AppButton(
                          height: 48, 
                          width: 382, 
                          buttonText: "Close", 
                          buttonTextColor: Colors.white, 
                          onTap: () {
                            Navigator.pop(context);
                          }, 
                          buttonColor: AppColor.primaryColor, 
                          fontSize: 16
                        ),
                    )
                  );
                }, 
                buttonColor: AppColor.primaryColor, 
                fontSize: 16
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}