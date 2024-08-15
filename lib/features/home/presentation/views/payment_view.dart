import 'package:flutter/material.dart';
import 'package:nestify/features/home/presentation/views/widgets/payment_view_body.dart';

class PaymentGatewayView extends StatelessWidget {
  final String clientUrl;
  const PaymentGatewayView({super.key, required this.clientUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Payment'),
      ),
      body: PaymentGateViewBody(
        clientUrl: clientUrl,
      ),
    );
  }
}
