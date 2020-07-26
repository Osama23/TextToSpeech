import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:TextToSpeech/screens/applicationsScreen.dart';
import 'package:TextToSpeech/screens/dashboardScreen.dart';
import 'package:TextToSpeech/screens/profileScreen.dart';
import 'package:TextToSpeech/screens/todoScreen.dart';
import 'package:TextToSpeech/chooseScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'profile-screen': (ctx) => ProfileScreen(),
        'todo-screen': (ctx) => TodoScreen(),
        'applications-screen': (ctx) => ApplicationsScreen(),
        'dashboard-screen': (ctx) => DashboardScreen(),
      },
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
  FlutterTts flutterTts = FlutterTts();
  ChooseParentScreen chooseParentScreen;
  TextEditingController textEditingController = TextEditingController();
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void _speak(String inputText) async {
    print(await flutterTts.getLanguages);
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(inputText);
    _startRouting();
    //  Navigator.of(context).pushNamed("profile-screen");
  }

  void _startRouting() {
    print('inside  _startRouting ');
    if (resultText.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Field can't be empty"),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }

    chooseParentScreen = ChooseParentScreen(resultText.toString());
    chooseParentScreen.streamController.stream.listen((data) {
      if (data == "Open profile screen" || data == "open profile screen") {
        print('*******data is $data');
        Navigator.of(context).pushNamed("profile-screen");
      } else if (data == "hello") {
        print('data is home Screen $data');
        Navigator.of(context).pushNamed("profile-screen");
      } else if (data == "Open to do screen") {
        print('data is todo Screen $data');
        Navigator.of(context).pushNamed("todo-screen");
      } else if (data == "Open dashboard screen") {
        print('data is dashboard Screen $data');
        Navigator.of(context).pushNamed("dashboard-screen");
      } else if (data == "Open applications screen") {
        print('data is applications Screen $data');
        Navigator.of(context).pushNamed("applications-screen");
      }
      print("listen value- $data");
    });
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );

    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );

    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );

    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );

    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            // TextField(
            //   controller: textEditingController,
            // ),
            // RaisedButton(
            //   onPressed: () => _speak(textEditingController.text.toString()),
            //   child: Text('Press To Say Hello'),
            // ),
            // SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.cyanAccent[100],
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                resultText,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // FloatingActionButton(
                //   child: Icon(Icons.cancel),
                //   mini: true,
                //   backgroundColor: Colors.deepOrange,
                //   onPressed: () {
                //     if (_isListening)
                //       _speechRecognition.cancel().then(
                //             (result) => setState(() {
                //               _isListening = result;
                //               resultText = "";
                //             }),
                //           );
                //   },
                // ),
                FloatingActionButton(
                  child: Icon(Icons.mic),
                  onPressed: () {
                    print('##############');
                    print(
                        'is available == $_isAvailable && is listening == $_isListening');
                    if (_isAvailable && !_isListening)
                      _speechRecognition.listen(locale: "en_US").then((result) {
                        print('$result');
                        print('*************************');
                        print('is available == $_isAvailable && is listening == $_isListening');
                        _startRouting();
                      });
                  },
                  backgroundColor: Colors.pink,
                ),
                // FloatingActionButton(
                //   child: Icon(Icons.stop),
                //   mini: true,
                //   backgroundColor: Colors.deepPurple,
                //   onPressed: () {
                //     if (_isListening)
                //       _speechRecognition.stop().then(
                //             (result) => setState(() => _isListening = result),
                //           );
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
