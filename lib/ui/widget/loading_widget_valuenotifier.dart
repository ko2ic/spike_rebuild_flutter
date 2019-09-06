import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spike_rebuild_flutter/scopedmodel/valuenotifier/loading_value.dart';

class LoadingWidget5 extends StatelessWidget {
  final LoadingValue value;

  const LoadingWidget5(this.value);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: value.isLoading,
      builder: (_context, isLoading, _child) {
        return (isLoading)
            ? const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0x44000000),
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
