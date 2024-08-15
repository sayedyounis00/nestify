import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymentGateViewBody extends StatefulWidget {
  final String clientUrl;
  const PaymentGateViewBody({super.key, required this.clientUrl});

  @override
  State<PaymentGateViewBody> createState() => _PaymentGateViewBodyState();
}

class _PaymentGateViewBodyState extends State<PaymentGateViewBody> {
  InAppWebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    startPayment();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
      ),
      onWebViewCreated: (controller) {
        _webViewController = controller;
        startPayment();
      },
      onLoadStop: (controller, url) {
        if (url != null && url.queryParameters.containsKey('success')) {
          log('payment Success');
        } else if (url != null &&
            url.queryParameters.containsKey('success') &&
            url.queryParameters['success'] == 'false') {
          log('failed');
        }
      },
    );
  }

  void startPayment() {
    _webViewController?.loadUrl(
      urlRequest: URLRequest(
        url: WebUri.uri(Uri.parse(
          widget.clientUrl,
        )),
      ),
    );
  }
}
