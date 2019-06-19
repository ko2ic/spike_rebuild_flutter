import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingWidget0 extends StatelessWidget {
  final bool isLoading;

  const LoadingWidget0(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            decoration: const BoxDecoration(color: Color(0x44000000)),
            child: Center(child: const CircularProgressIndicator()),
          )
        : Container();
  }
}
