import 'package:codeshastra/screens/items.dart';
import 'package:codeshastra/screens/virtual_ar_view_screen.dart';
import 'package:pay/pay.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ItemDetailsScreen extends StatefulWidget {
  Items? clickedItemInfo;

  ItemDetailsScreen({
    this.clickedItemInfo,
  });

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  var _razorpay = Razorpay();
  final Future<PaymentConfiguration> _googlePayConfigFuture =
      PaymentConfiguration.fromAsset('gpay.json');

  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment successful");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaymentConfiguration>(
        future: _googlePayConfigFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  widget.clickedItemInfo!.itemName.toString(),
                ),
              ),
              floatingActionButton: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        var options = {
                          "key": "rzp_test_53topzkI5ia0Ge",
                          "amount": 200 * 100,
                          "name": "abcd",
                          "description": "title",
                          "prefill": {
                            "contact": "9326549053",
                            "email": "yashs230602@gmail.com"
                          },
                        };

                        try {
                          _razorpay.open(options);
                        } catch (e) {
                          print(e.toString());
                        }
                      },
                      child: const Text(
                        'Pay with RazorPay',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.pinkAccent,
                    onPressed: () {
                      //try item virtually (arview)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => VirtualARViewScreen(
                                    clickedItemImageLink: widget
                                        .clickedItemInfo!.itemImage
                                        .toString(),
                                  )));
                    },
                    label: const Text(
                      "Try Virtually (AR View)",
                    ),
                    icon: const Icon(
                      Icons.mobile_screen_share_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        widget.clickedItemInfo!.itemImage.toString(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          widget.clickedItemInfo!.itemName.toString(),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 6.0),
                        child: Text(
                          widget.clickedItemInfo!.itemDescription.toString(),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.clickedItemInfo!.itemPrice.toString() + " \$",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 310.0),
                        child: Divider(
                          height: 1,
                          thickness: 2,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
