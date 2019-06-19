import 'package:flutter/material.dart';
import 'package:spike_rebuild_flutter/ui/top_page_bloc.dart';
import 'package:spike_rebuild_flutter/ui/top_page_inheritedwidget.dart';
import 'package:spike_rebuild_flutter/ui/top_page_redux.dart';
import 'package:spike_rebuild_flutter/ui/top_page_scopedmodel.dart';
import 'package:spike_rebuild_flutter/ui/top_page_setstate.dart';

import 'repository/count_repository.dart';
import 'scopedmodel/loading_model.dart';
import 'ui/top_page_bloc_inheritedwidget.dart';
import 'ui/top_page_bloc_simple.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final CountRepository _repository = CountRepository();

  final LoadingModel _loadingModel = LoadingModel();

  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text("setStateの場合"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopPage0(_repository),
                    fullscreenDialog: true,
                  ));
            },
          ),
          ListTile(
            title: const Text("InheritedWidgetの場合"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopPage1(_repository),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Sceoped Modelの場合"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopPage2(_repository, _loadingModel),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("BLoCの場合(Provider利用)"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopPage3(_repository),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("BLoCの場合(blocをコンストラクタで渡すパターン)"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopPage3_0(_repository),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("BLoCの場合(InheritedWidgetでのパターン)"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopPage3_1(_repository),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Reduxの場合"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopPage4(_repository),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
