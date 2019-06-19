import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingWidget1 extends StatelessWidget {
  final Stream stream;

  const LoadingWidget1(this.stream);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: false,
        stream: stream,
        builder: (context, snapshot) {
          return (snapshot.data)
              ? Container(
                  decoration: const BoxDecoration(color: Color(0x44000000)),
                  child: Center(child: const CircularProgressIndicator()),
                )
              : Container();
        });
  }
}
