import 'package:flutter/material.dart';
import 'package:shoes_app/presentation/pages/main/cart/checkout_success_page.dart';
import 'package:shoes_app/presentation/widget/checkout_item_card.dart';
import 'package:shoes_app/presentation/widget/custom_button.dart';
import 'package:shoes_app/utils/style/styles.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = "checkout-page";
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildListItem(context),
                buildDetailAdress(context),
                buildPaymentSummary(context),
                const SizedBox(height: 35),
                buildCheckout(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(color: kBlackColor),
      toolbarHeight: 87,
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      title: Text(
        "Checkout Details",
        style: Theme.of(context).textTheme.headline6?.copyWith(color: kGreyColor),
      ),
    );
  }

  Widget buildListItem(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order List",
          style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor, fontSize: 22),
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CheckoutItemCard(),
            CheckoutItemCard(),
          ],
        ),
      ],
    );
  }

  Container buildDetailAdress(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adress Details",
            style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: 20,
                backgroundColor: kGreyColor.withOpacity(0.3),
                child: Center(
                  child: Icon(Icons.my_location, color: kBlackColor, size: 20),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Store Location",
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(color: kGreyColor),
                  ),
                  Text(
                    "Adidas Singapore",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(color: kBlackColor, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 12),
              height: 25,
              child: VerticalDivider(color: kGreyColor, thickness: 3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: 20,
                backgroundColor: kGreyColor.withOpacity(0.3),
                child: Center(
                  child: Icon(Icons.location_on_rounded, color: kBlackColor, size: 20),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Address",
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(color: kGreyColor),
                  ),
                  Text(
                    "Jakarta",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(color: kBlackColor, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget buildPaymentSummary(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Adress Details",
            style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Quantity",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(color: kGreyColor),
              ),
              Text(
                "2 Items",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Price",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(color: kGreyColor),
              ),
              Text(
                "\$575.96",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: kRedColor, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(color: kGreyColor),
              ),
              Text(
                "Free",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor, fontSize: 16),
              ),
            ],
          ),
          Divider(thickness: 1, color: kGreyColor),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: kBlackColor, fontSize: 16),
              ),
              Text(
                "\$575.92",
                style: Theme.of(context).textTheme.headline6?.copyWith(color: kGreenColor, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCheckout(BuildContext context) {
    return CustomButton(
      title: "Checkout Now",
      onPressed: () {
        Navigator.pushNamed(context, CheckoutSuccessPage.routeName);

      },
    );
  }



}
