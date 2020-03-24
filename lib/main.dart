// https://www.kancloud.cn/marswill/dark2_document/709092
//git :https://blog.csdn.net/qq_40323256/article/details/92384334
//flutter:https://flutterchina.club/tutorials/

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/*void main() => runApp(new MyApp());*/

void main() {
  runApp(new MaterialApp(
    title: 'ButtonTap  Test',
    home: new CounterUpdate(),
  )
  );
}

//创建一个标题栏
class MyAppBar extends StatelessWidget{
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"
  final Widget title;
  
  @override
  Widget build(BuildContext context) {
    return new Container( // 这里是圆括号
      height: 64.0, //单位是逻辑上的像素（包括手机顶部的导航栏）
      padding: const EdgeInsets.symmetric(horizontal: 8.0), //左右都有8个像素的填充
      decoration: new BoxDecoration(color: Colors.blue[500]), //填充背景,后面的数字表示深浅
      // Row 是水平方向的线性布局（linear layout）,使用Row 布局来排列其子项
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: '导航栏',
              onPressed: null),  // null 会禁用 button
          // 中间的title widget被标记为Expanded, ，这意味着它会填充尚未被其他子项占用的的剩余可用空间,
          // Expanded可以拥有多个children,然后使用flex参数来确定他们占用剩余空间的比例
          new Expanded(
              child: title
          ),
          new IconButton(
              icon: new Icon(Icons.search), 
              tooltip: '搜索',
              onPressed: null),
        ],
      ),
    );
  }
}

//使用标题栏
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      child: new Column(
        children: <Widget>[
          // 在Column的顶部，放置了一个MyAppBar实例，将一个Text widget作为其标题传递给应用程序栏
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
              child: new Center(
                child: new Text('Hello World'),
              ) 
          ),
        ],
      ),
    );
  }

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords  extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  // 保存建议的单词对
  final _suggestion = <WordPair>[];
  // 增大字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // 收藏的集合
  final _saved = new Set<WordPair>();
  
  @override
  Widget build(BuildContext context) {
    /*final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);*/
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd) return new Divider();

        final index = i ~/2;

        if(index >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestion[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ?Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

}

//创建Material样式
class TutorialHome  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu),tooltip: '导航栏', onPressed: null),
        title: new Text('搜索'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search),tooltip: '搜索', onPressed: null)
        ],
      ),
      body: new Center(
        child: new Text('Hello World'),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip:'Add',
          child: new Icon(Icons.add),
          onPressed: null
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped');
      },

      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}

//计数
class Counter extends StatefulWidget{
  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState  extends State<Counter>{
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('Increment'),
        ),
        new Text('Count : $_counter'),
      ],
    );
  }
}

//Count的升级版-----------start
class CounterDisplay extends StatelessWidget {
  // 注意：圆括号里面有一个大括号
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count :$count');
  }
}

class CounterIncrementor extends StatelessWidget{
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }
}

class CounterUpdate extends StatefulWidget{
  @override
  _CounterStateUpdate createState() => new _CounterStateUpdate();
}

class _CounterStateUpdate  extends State<CounterUpdate>{
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new CounterDisplay(count:_counter),
        new CounterIncrementor(onPressed: _increment),
      ],
    );
  }
}
//Count的升级版-----------end
















