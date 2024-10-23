import 'package:nedaj/auth/screens/phone_verification_screen.dart';
import 'package:nedaj/export.dart';

class _CenterDockedFloatingActionButtonLocation
    extends FloatingActionButtonLocation {
  const _CenterDockedFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabHalfWidth =
        scaffoldGeometry.floatingActionButtonSize.width / 2.0;
    return Offset(
        scaffoldGeometry.scaffoldSize.width / 2.0 - fabHalfWidth,
        scaffoldGeometry.scaffoldSize.height -
            scaffoldGeometry.floatingActionButtonSize.height -
            16.0);
  }
}

class TermsAndConditionsWithAgreeButton extends StatefulWidget {
  final String url;
  const TermsAndConditionsWithAgreeButton({super.key, required this.url});

  @override
  State<TermsAndConditionsWithAgreeButton> createState() =>
      _TermsAndConditionsWithAgreeButtonState();
}

class _TermsAndConditionsWithAgreeButtonState
    extends State<TermsAndConditionsWithAgreeButton>
    with SingleTickerProviderStateMixin {
  late final WebViewController _controller;
  bool isLoading = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          _controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Terms and Conditions'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _controller.canGoBack()) {
                _controller.goBack();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading)
              Center(
                child: FancyLoadingAnimation(animation: _animation),
              ),
          ],
        ),
        floatingActionButtonLocation:
            const _CenterDockedFloatingActionButtonLocation(),
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Constants.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Get.to(() => PhoneVerificationScreen(phoneNumber: '+251930884402'));
            },
            child: Text('Agree'),
          ),
        ),
      ),
    );
  }
}

class FancyLoadingAnimation extends StatelessWidget {
  final Animation<double> animation;

  const FancyLoadingAnimation({Key? key, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.5 + 0.5 * animation.value,
          child: Opacity(
            opacity: 0.5 + 0.5 * animation.value,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Constants.primaryColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: const Icon(
                Icons.article_outlined,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        );
      },
    );
  }
}
