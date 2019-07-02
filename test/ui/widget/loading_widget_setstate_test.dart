import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spike_rebuild_flutter/ui/widget/loading_widget_setstate.dart';

void main() {
  testWidgets('isLoadingがtrueの場合', (WidgetTester tester) async {
    final target = const LoadingWidget0(true);

    await tester.pumpWidget(target);

    expect(find.byWidget(target), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('isLoadingがfalseの場合', (WidgetTester tester) async {
    final target = const LoadingWidget0(false);

    await tester.pumpWidget(target);

    expect(find.byWidget(target), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
