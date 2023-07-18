import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';
import 'package:jinie_builder/models/user_info.dart';

enum VendorMode { none, mobis, lge }

enum PlatformMode { none, mobis, lge }

class PlatformScreen extends StatefulWidget {
  final String theme;
  final UserInfo userInfo;

  const PlatformScreen({
    super.key,
    required this.theme,
    required this.userInfo,
  });

  @override
  State<PlatformScreen> createState() => _ModeScreen();
}

class _ModeScreen extends State<PlatformScreen> {
  late int vendor;
  late int platform;
  late String theme;
  late UserInfo userInfo;

  @override
  void initState() {
    vendor = VendorMode.none.index;
    platform = PlatformMode.none.index;
    theme = widget.theme;
    userInfo = widget.userInfo;
    super.initState();
  }

  checkVendor(VendorMode mode) {
    setState(() {
      vendor = mode.index;
    });
  }

  checkPlatform(PlatformMode mode) {
    setState(() {
      platform = mode.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return 'indigo' == 'pink'
            ? AppTheme.pinkStrongPink
            : AppTheme.indigoYellow;
      }
      return 'indigo' == 'pink' ? AppTheme.pinkGreen : AppTheme.indigoDeepBlue;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient:
              theme == 'pink' ? AppTheme.gradientPink : AppTheme.gradientIndigo,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please select the Platform.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 2.0,
                      color: theme == 'pink'
                          ? AppTheme.pinkGreen
                          : AppTheme.indigoYellow,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ]),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/vendor_mobis_logo.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: vendor == VendorMode.mobis.index,
                            onChanged: (value) => {
                              if (value!)
                                {checkVendor(VendorMode.mobis)}
                              else
                                {checkVendor(VendorMode.none)}
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 2.0,
                      color: theme == 'pink'
                          ? AppTheme.pinkGreen
                          : AppTheme.indigoYellow,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ]),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/vendor_lge_logo.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: vendor == VendorMode.lge.index,
                            onChanged: (value) => {
                              if (value!)
                                {checkVendor(VendorMode.lge)}
                              else
                                {checkVendor(VendorMode.none)}
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
