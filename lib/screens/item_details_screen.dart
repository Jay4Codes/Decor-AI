import 'package:codeshastra/screens/items.dart';
import 'package:codeshastra/screens/virtual_ar_view_screen.dart';
import 'package:codeshastra/utils/constants.dart';
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        widget.clickedItemInfo!.itemImage.toString(),
                        height: 400,
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
                          widget.clickedItemInfo!.itemPrice.toString() + " \₹",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(
                          height: 1,
                          thickness: 2,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    backgroundColor:
                                        Color(0xffbebebe).withOpacity(0.2)),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Pay with ',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Image.asset(
                                      'assets/images/razorpay.png',
                                      height: 30,
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: FloatingActionButton.extended(
                              backgroundColor: kPrimaryColor,
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
                                "Try Virtually",
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.mobile_screen_share_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
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
