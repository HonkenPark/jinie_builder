import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jinie_builder/common/theme.dart';

class SpinLoader extends StatelessWidget {
  final String theme;

  const SpinLoader({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ModalBarrier(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SpinKitWaveSpinner(
                color: theme == 'pink'
                    ? AppTheme.pinkStrongPink
                    : AppTheme.indigoYellow,
                trackColor: Colors.white,
                waveColor: AppTheme.waveBlue,
                // itemBuilder: (BuildContext context, int index) {
                //   return DecoratedBox(
                //     decoration: BoxDecoration(
                //       color: index.isEven ? Colors.black : Colors.white,
                //     ),
                //   );
                // },
                size: 120,
              ),
              const Text(
                'Now Building',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
