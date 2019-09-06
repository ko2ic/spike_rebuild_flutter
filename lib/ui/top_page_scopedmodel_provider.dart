import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:spike_rebuild_flutter/repository/count_repository.dart';
import 'package:spike_rebuild_flutter/scopedmodel/valuenotifier/counter_value.dart';
import 'package:spike_rebuild_flutter/scopedmodel/valuenotifier/loading_value.dart';
import 'package:spike_rebuild_flutter/ui/widget/loading_widget_valuenotifier.dart';

class TopPage2_2 extends StatelessWidget {
  final CountRepository _repository;

  TopPage2_2(this._repository);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<LoadingValue2>(
          builder: (_) => LoadingValue2(),
        ),
        ListenableProvider<CounterValue2>(
          builder: (context) {
            var loading = Provider.of<LoadingValue2>(context, listen: false);
            return CounterValue2(_repository, loading);
          },
        ),
      ],
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text('ValueNotifier+Provider Demo'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _WidgetA(),
                _WidgetB(),
                _WidgetC(),
              ],
            ),
          ),
          const LoadingWidget2_2(),
        ],
      ),
    );
  }
}

class _WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetA#build()");
    var logic = Provider.of<CounterValue2>(context, listen: false);
    return Center(
      child: ValueListenableBuilder<int>(
        valueListenable: logic,
        builder: (_context, count, _child) {
          return Text(
            '$count',
            style: Theme.of(context).textTheme.display1,
          );
        },
      ),
    );
  }
}

class _WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetB#build()");
    return const Text('I am a widget that will not be rebuilt.');
  }
}

class _WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetC#build()");
    return RaisedButton(
      onPressed: () {
        Provider.of<CounterValue2>(context, listen: false).incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}
