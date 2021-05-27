import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var lastdivnum = 1,
      permObj = [
      ],
      output = '',
      order = 1,
      prefix = {
        "setprefix": '',
        "setsuffix": '',
        "objdelimiter": '',
        "objjoin": ''
      };
  final controllerOutput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerOutput.dispose();
    super.dispose();
  }

  permute() {
    var permute = (v, {m = false}) {
      var p = -1,
          j,
          k,
          f,
          r,
          l = v.length,
          q = 1,
          i = l + 1;
      --i;
      q *= i;
      var x = [new List(l), new List(l), new List(l), new List(l)];
      j = q;
      k = l + 1;
      i = -1;
      for (; ++i < l; x[2][i] = i, x[1][i] = x[0][i] = j /= --k) {

      }

      for (r = new List(q); ++p < q;) {
        r[p] = new List(l);
        i = -1;
        for (; ++i < l; --x[1][i] != --x[1][i]) {
          x[1][i] = x[0][i];
          x[2][i] = (x[2][i] + 1) % l;
          if (x[3][i] != null) r[p][i] = m ? x[3][i] : v[x[3][i]];
          f = 0;

          for ((x[3][i] = x[2][i]); !(f == 0); f = !f) {
            for (j = i; j == true; x[3][--j] == x[2][i] &&
                (x[3][i] = x[2][i] = (x[2][i] + 1) % l && f == 1)) {

            }
          }
        }
      }

      return r;
    };
    var perobjs = new List();
    var perobjscnt = 0;
    var permobj = '';

    for (var x = 0; x < permObj.length; x++) {
      permobj = permObj[x]["value"];
      if (permobj != '') {
        perobjs.add(permobj);
        perobjscnt++;
      }
    }
    var pre = prefix["setprefix"].replaceAll(r'/\\x/g', '\n');
    var suf = prefix["setsuffix"].replaceAll(r'/\\x/g', '\n');
    var joinobjs = prefix["objdelimiter"].replaceAll(r'/\\x/g', '\n');
    var joinperms = prefix["objjoin"].replaceAll(r'/\\x/g', '\n');

    var out = permute(perobjs).map((objs) {
      return objs[0] != null ? objs.join(joinobjs) + "\n" : perobjs.join(
          joinobjs) + "\n";
    });

    setState(() {
      output = out = out.join(joinperms);
    });

    controllerOutput.text = output;
    print(output);
  }

  var todo = List<Widget>();
  int _index = 0;

  void _add() {
    int keyValue = _index;
    permObj.add({'id': _index, 'value': '',});
    var _formdataIndex = permObj.indexWhere((data) => data['id'] == keyValue);

    todo = List.from(todo)
      ..add(Column(
        key: Key("${keyValue}"),
        children: <Widget>[
          ListTile(
            leading: Text('Name: '),
            title: TextField(
              onChanged: (val) {
                permObj[_formdataIndex]['value'] = val;
              },
            ),
          ),
        ],
      ));
    setState(() => ++_index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: permute,
        child: Icon(Icons.link),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add, color: Colors.white,),
            onPressed: _add,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...todo,
              TextField(controller: controllerOutput, maxLines: 10,)],
          ),
        ),
      ),
    );
  }
}
