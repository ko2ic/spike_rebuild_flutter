import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spike_rebuild_flutter/repository/count_repository.dart';
import 'package:spike_rebuild_flutter/scopedmodel/valuenotifier/counter_value.dart';
import 'package:spike_rebuild_flutter/scopedmodel/valuenotifier/loading_value.dart';
import 'package:spike_rebuild_flutter/ui/widget/loading_widget_valuenotifier.dart';

class TopPage2_1 extends StatelessWidget {
  final CountRepository repository;
  final LoadingValue loadingValue;

  TopPage2_1(this.repository, this.loadingValue);

  @override
  Widget build(BuildContext context) {
    return _HomePage(
      repository: repository,
      loadingValue: loadingValue,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ValueNotifier Demo'),
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
    );
  }
}

class _HomePage extends StatefulWidget {
  final CountRepository repository;
  final LoadingValue loadingValue;

  _HomePage({
    Key key,
    this.repository,
    this.loadingValue,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _HomePageState createState() => _HomePageState();

  static _HomePageState of(BuildContext context, {bool rebuild = true}) {
    if (rebuild) {
      return (context.inheritFromWidgetOfExactType(_MyInheritedWidget) as _MyInheritedWidget).data;
    }
    return (context.ancestorInheritedElementForWidgetOfExactType(_MyInheritedWidget).widget as _MyInheritedWidget).data;
  }
}

class _HomePageState extends State<_HomePage> {
  CounterValue counter;

  @override
  void initState() {
    super.initState();
    counter = CounterValue(widget.repository, widget.loadingValue);
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(
      data: this,
      child: Stack(
        children: <Widget>[
          widget.child,
          LoadingWidget2_1(widget.loadingValue),
        ],
      ),
    );
  }
}

class _MyInheritedWidget extends InheritedWidget {
  _MyInheritedWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final _HomePageState data;

  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget) {
    return true;
  }
}

class _WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("called _WidgetA#build()");
    final _HomePageState state = _HomePage.of(context, rebuild: false);

    return Center(
      child: ValueListenableBuilder<int>(
          valueListenable: state.counter.value,
          builder: (_context, count, _child) {
            return Text(
              '$count',
              style: Theme.of(context).textTheme.display1,
            );
          }),
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
    final _HomePageState state = _HomePage.of(context, rebuild: false);
    return RaisedButton(
      onPressed: () {
        state.counter.incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}
