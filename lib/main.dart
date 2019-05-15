import 'package:flutter/material.dart';

Container defaultText(text, { margin, controller, final fontSize = 20.0, textAlign}) =>
    Container(
      margin: margin ?? const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
          textAlign: textAlign,
          // controller: controller,
        ),
      ),
    );

/// 구분 선
class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 1.0,
      width: 1.0,
      color: Colors.black54,
      margin: const EdgeInsets.only(left: 24.0, right: 24.0),
    );
  }
}

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Bottom sheet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          _settingModalBottomSheet(context);
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}


void _settingModalBottomSheet(context){
  showModalBottomSheet(
      context: context,
      builder: (WidgetBuilder) => bottomSheetBuilder()
  );
}

Widget bottomSheetBuilder(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: const BorderRadius.only(
          topRight: const Radius.circular(32.0),
          topLeft: const Radius.circular(32.0)),
      boxShadow: [
        BoxShadow(
          blurRadius: 32.0,
          color: Colors.black87
        )
      ]
    ),
    child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /// 타이틀
          defaultText(
              'test',
              margin: const EdgeInsets.only(top: 24, bottom: 8),
              fontSize: 24.0,
              textAlign: TextAlign.center
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              /// 위치
              defaultText(
                  'test',
                  margin: const EdgeInsets.only(bottom: 8, right:24),
                  fontSize: 14.0,
                  textAlign: TextAlign.right
              ),
              /// 기간
              defaultText(
                  'test',
                  margin: const EdgeInsets.only(bottom: 8),
                  fontSize: 14.0,
                  textAlign: TextAlign.right
              ),
            ],
          ),
          VerticalDivider(),
          /// 내용
          Container(
            margin: const EdgeInsets.only(top:8, left: 24, right: 24, bottom: 16),
            /* decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0))
                ),*/
            child: defaultText(
                'test',
                fontSize: 16.0,
                textAlign: TextAlign.center

            ),
          ),
          /// 리더보드 버튼
          Container(
              margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: RaisedButton(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                onPressed: () => {},
                color: const Color(0xFFFFFFFF),
                child: Icon(
                  Icons.insert_chart,
                  size:40.0,
                  color:Colors.black87,
                ),
                /*Text(
                      R.string.view_field_title,
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),*/
              )
          ),
        ]
    ),
  );
}