import 'package:flutter/material.dart';
import 'package:coverflow/coverflow.dart';

class Stats extends StatelessWidget {
  const Stats();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<int> scores = [80,88,88,86];
    List<String> tests = ["Int Basics Assessment", "Email Assessment", "Win Assessment", "Mac Assessment"];
    return Expanded(
    
        child: CoverFlow(images: 
          [
            for(var i=0; i< scores.length; i++) SizedBox(
                width: 200,
                height: 200,
                child: ElevatedButton(
                  onPressed: () {
                      //Get.to(Assessment1());
                  },
                  style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9F7BFF),
                  ),

                  child: Container(
                    color: Colors.white,
                    child: Text('${tests.elementAt(i)}: ${scores.elementAt(i)} %',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Arial',
                    ),)
                    
                  ),
                )
              ),
          ] 
        ),
    );
    // return Expanded(
    //   child: ListView(
    //       scrollDirection: Axis.vertical,
    //       children: [
    //         for(var score in scores) SizedBox(
    //             width: 160,
    //             //height: 160,
    //             child: Text('Score: $score'),
    //           ),
    //       ]        
    //   ),
    // );
  }
}