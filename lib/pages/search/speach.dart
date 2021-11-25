import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../bars/bottombarNav.dart';
import 'search.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:highlight_text/highlight_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../../sidebar/sidebar.dart';

class Speach extends StatefulWidget {
  static const routname = '/speech';
  @override
  _SpeechState createState() => _SpeechState();
}

class _SpeechState extends State<Speach> {
  final Map<String, HighlightedWord> _highlights = {
    'eco friendly': HighlightedWord(
      onTap: () => print('eco friendly'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'corrugated': HighlightedWord(
      onTap: () => print('corrugated'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'cosmetics': HighlightedWord(
      onTap: () => print('cosmetics'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'packaging': HighlightedWord(
      onTap: () => print('packaging'),
      textStyle: const TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'box': HighlightedWord(
      onTap: () => print('box'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text =
      'Press the button and start speaking then again press it for view related products';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Scaffold _page(dynamic context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
    final bottomBarIndex = -1;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          automaticallyImplyLeading: false, // Don't show the leading button
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(CupertinoIcons.left_chevron, color: Colors.white),
              ),
              Container(
                //color: Colors.black,
                width: screenWidth / 1.6,
                alignment: Alignment.center,
                padding: new EdgeInsets.only(left: 10),
                child: Text(
                  'Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Your widgets here
            ],
          ),
          backgroundColor: Colors.pink[700],
          centerTitle: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: AvatarGlow(
          animate: _isListening,
          glowColor: Colors.red,
          endRadius: 75.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            backgroundColor: Colors.blue[400],
            onPressed: _listen,
            child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            reverse: true,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 150.0),
              child: TextHighlight(
                text: _text,
                words: _highlights,
                textStyle: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          bottombarNav(context, bottomBarIndex),
        ],
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      await new Future.delayed(const Duration(seconds: 2));
      String temp = _text ==
              'Press the button and start speaking then again press it for view related products'
          ? ''
          : _text;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Search(title: temp.toLowerCase()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _page(context),
          SideBar(),
        ],
      ),
    );
  }
}
