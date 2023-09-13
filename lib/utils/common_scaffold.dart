import 'package:flutter/material.dart';
import 'package:ecommerce/utils/colors.dart';

import 'animations/animate_search.dart';

class CommonScaffold extends StatefulWidget {
  final Widget child;
  const CommonScaffold({
    super.key,
    required this.child,
  });
// Column(children: const [
//           Text("Wallet"),
//           SizeBoxH(8),
//           Text(r"$125445555"),
  // ]),
  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SearchBarAnimation(
                      trailingWidget: const Icon(Icons.search),
                      secondaryButtonWidget: const Icon(Icons.close_rounded),
                      buttonWidget: const Icon(Icons.search),
                      textEditingController: TextEditingController(),
                      isOriginalAnimation: false,
                      buttonBorderColour: Colors.black45,
                      onFieldSubmitted: (String value) {
                        debugPrint('onFieldSubmitted value $value');
                      },
                    ),
                  ],
                ),
              ),
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}

class CommonScaffoldWithAppbar extends StatefulWidget {
  final Widget child;
  final String header;
  const CommonScaffoldWithAppbar({
    super.key,
    required this.header,
    required this.child,
  });

  @override
  State<CommonScaffoldWithAppbar> createState() =>
      _CommonScaffoldWithAppbarState();
}

class _CommonScaffoldWithAppbarState extends State<CommonScaffoldWithAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 32,
        title: Text(widget.header),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.child,
      ),
    );
  }
}
