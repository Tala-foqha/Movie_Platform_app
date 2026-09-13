// core/deep_link/deep_link_handler.dart
import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/home/home_view.dart';
import 'package:movie_platform_app/main.dart';

class DeepLinkHandler extends StatefulWidget {
  final Widget child;

  const DeepLinkHandler({
    super.key,
    required this.child,
  });

  @override
  State<DeepLinkHandler> createState() => _DeepLinkHandlerState();
}

class _DeepLinkHandlerState extends State<DeepLinkHandler> {
  final AppLinks _appLinks = AppLinks();

  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();

    _initDeepLinks();
  }

  void _initDeepLinks() {
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        print('DEEP LINK RECEIVED: $uri');

        if (uri.scheme == 'movieapp' &&
            uri.host == 'checkout-success') {
          _goToHomeAndShowSuccess();
        }
      },
    );
  }

  void _goToHomeAndShowSuccess() {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    final navigator = navigatorKey.currentState;

    if (navigator == null) return;

    navigator.pushNamedAndRemoveUntil(
      HomeView.routeName,
      (route) => false,
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    final navigatorContext = navigatorKey.currentContext;

    if (navigatorContext == null) return;

    showDialog(
      context: navigatorContext,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color:AppColrs.primaryColor,
                size: 70,
              ),

              const SizedBox(height: 20),

              const Text(
                'Checkout Done!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Your payment has been completed successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColrs.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 6,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 24,vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12)
                    )
                  ),
                  
                
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back to Home',
                    style:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  });
}
  

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}