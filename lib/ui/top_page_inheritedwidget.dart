import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomePage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget Demo'),
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
  _HomePage({
    Key key,
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
    //return (context.ancestorWidgetOfExactType(_MyInheritedWidget) as _MyInheritedWidget).data;
  }
}

class _HomePageState extends State<_HomePage> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(
      data: this,
      child: widget.child,
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
    final _HomePageState state = _HomePage.of(context);

    return Center(
      child: Text(
        '${state.counter}',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}

class _WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('I am a widget that will not be rebuilt.');
  }
}

class _WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _HomePageState state = _HomePage.of(context, rebuild: false);
    return RaisedButton(
      onPressed: () {
        // Scaffold.of(context).showSnackBar(SnackBar(content: Text('message')));
        state._incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}