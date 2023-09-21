import 'package:flutter/material.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.height,
    required this.width,
    required this.buttonText,
    required this.buttonTextColor,
    required this.onTap,
    required this.buttonColor,
  }) : super(key: key);

  final double height;
  final double width;
  final String buttonText;
  final Color buttonTextColor;
  final Function()? onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.plainBlack,
              offset: const Offset(6, 4),
            )
          ]),
      child: InkWell(
        onTap: onTap,
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: buttonTextColor,
              fontSize: 16),
        )),
      ),
    );
  }
}

class ContactListView extends StatelessWidget {
  const ContactListView(
      {Key? key,
      required this.profilePicture,
      required this.listNumber,
      required this.tileTitle,
      required this.onTap,
      required this.containerHeight})
      : super(key: key);

  final Widget profilePicture;
  final double containerHeight;
  final int listNumber;
  final String tileTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      child: ListView.builder(
          itemCount: listNumber,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: index % 2 == 0
                  ? ListTile(
                      tileColor: AppColor.tetiaryColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: AppColor.plainBlack,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      leading: profilePicture,
                      title: Text(
                        tileTitle,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: onTap,
                    )
                  : ListTile(
                      tileColor: AppColor.secondaryColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: AppColor.plainBlack,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      leading: profilePicture,
                      title: Text(
                        tileTitle,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      onTap: onTap,
                    ),
            );
          }),
    );
  }
}

class DialogueBox extends StatelessWidget {
  const DialogueBox(
      {Key? key,
      required this.dialogIcon,
      required this.dialogText,
      required this.dialogButton})
      : super(key: key);

  final Widget dialogIcon, dialogText, dialogButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        height: 428,
        width: 380,
        decoration: BoxDecoration(color: AppColor.secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dialogIcon,
            const SizedBox(
              height: 32,
            ),
            dialogText,
            const SizedBox(
              height: 64,
            ),
            dialogButton
          ],
        ),
      ),
    );
  }
}
