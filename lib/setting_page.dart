import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
        _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
        _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      },
    );
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            var options = {
              'key': 'rzp_live_IzIucfbDy3rWxn',
              'amount': 50000, //in the smallest currency sub-unit.
              'name': 'Baaz',
              'description': 'Payment',
              'timeout': 300, // in seconds
              'prefill': {
                'contact': '9123456789',
                'email': 'gaurav.kumar@example.com'
              }
            };
            _razorpay.open(options);
          },
          child: const Text("Pay Now"),
        ),
      ),
    );
  }
}
