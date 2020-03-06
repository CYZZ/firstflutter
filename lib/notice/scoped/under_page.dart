import 'package:flutter/material.dart';
import 'blocs/bloc_provider.dart';

class UnderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider().bloc;
    print('UnderPage->build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Page'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add),
            onPressed: () {
              bloc.increment();
            },
          ),
          FlatButton(
            child: Icon(Icons.create_new_folder),
            onPressed: () {
              BlocProvider test1 = BlocProvider.ofTest(context);
              print('test1 = $test1,context=$context');
            },
          )
        ],
      ),
      body: Center(
        child: StreamBuilder(
            stream: bloc.stream,
            initialData: bloc.value,
            builder: (context, snapshot) => Text(
                  "你点击的次数：${snapshot.data} times",
                  style: Theme.of(context).textTheme.display1,
                )),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () => bloc.increment(),
//        child: Icon(Icons.add),
//      ),
    );
  }
}
