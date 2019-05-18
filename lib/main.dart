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
        canvasColor: Colors.transparent
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
      drawer: Drawer(
        child: Container(
          width: 256,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: const Radius.circular(16.0),
                topRight: const Radius.circular(16.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // 사용자 닉네임
              Container(
                padding: const EdgeInsets.only(top: 104.0, left: 24.0, right: 16.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(16.0)
                  ),
                ),
                width: 256,
                child: Text(
                  'Nickname',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              // 사용자 집주소
              Container(
                padding: const EdgeInsets.only(
                  top: 8.0, bottom: 16.0,
                  left: 24.0, right: 16.0,
                ),
                width: 256,
                color: Colors.amber,
                child: Text(
                  'address',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              // 내가 도전한 퀘스트
              Container(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: RaisedButton(
                  elevation: 0.0,
                  highlightElevation: 0.0,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.amberAccent.withOpacity(0.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(Icons.local_airport),
                      ),
                      Text('내가 수행한 퀘스트')
                    ],
                  ),
                  onPressed: () => {
                    Navigator.pop(context)
                  },
                  color: Colors.transparent,
                ),
              ),
              // 환경설정
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: RaisedButton(
                  elevation: 0.0,
                  highlightElevation: 0.0,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.amberAccent.withOpacity(0.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Icon(Icons.settings),
                      ),
                      Text('환경설정')
                    ],
                  ),
                  onPressed: () => {
                    Navigator.pop(context)
                  },
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        )
      ),
      body: WillPopScope(
          onWillPop: _yon,
          child: Stack(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent
                  )
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    onPressed: () => {
                      _settingModalBottomSheet(context)
                    },
                    child: Icon(Icons.add)
                ),
              ),
            ],
          )
      ),
    );
  }

  Future<bool> _yon(){
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text("알림"),
            content: Text('정말 종료하시겠습니까?'),
            actions: <Widget>[
              FlatButton(
                  child: Text("네"),
                  onPressed: () => Navigator.pop(context, true)
              ),
              FlatButton(
                  child: Text("아니요"),
                  onPressed: () => Navigator.pop(context, false)
              )
            ]
        )
    );
  }
}


void _settingModalBottomSheet(context){
  showModalBottomSheet(
      context: context,
      builder: (WidgetBuilder) => bottomSheetBuilder(context)
  );
}

Widget bottomSheetBuilder(BuildContext context){
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
                onPressed: () => {
                  Navigator.pop(context)
                },
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