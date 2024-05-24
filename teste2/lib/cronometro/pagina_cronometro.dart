import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  late Stopwatch stopwatch;
  late Timer t;
  
  

  void handleStartStop() {
    if(stopwatch.isRunning) {
    stopwatch.stop();
    }
    else {
    stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(2, "0"); // this one for the miliseconds
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0"); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0"); // this is for the minute
    String hours = ((milli ~/ (1000 * 60 * 60)) % 24).toString().padLeft(2, "0");

    return "$hours:$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(const Duration(milliseconds: 30), (timer) {
    setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Center(
      child: Column( // this is the column
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CupertinoButton(
            onPressed: () {
            handleStartStop();
            },
            padding: const EdgeInsets.all(0),
            child: Container(
            height: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              border: Border.all(
              color: Colors.blue,
              width: 4,
              ),
            ),
            child: Text(returnFormattedText(), style: const TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),),
            ),
          ),

          const SizedBox(height: 20,),

          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue),
              color: Colors.white,
            ),
            child: CupertinoButton(
                 // this the cupertino button and here we perform all the reset button function
              onPressed: () {
                stopwatch.reset();
              },
              padding: const EdgeInsets.all(0),
              child: const Text("Zerar", style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        
      ),
      ),
    ),
    ); 
  }
}
