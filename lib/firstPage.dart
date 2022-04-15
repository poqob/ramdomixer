import 'package:flutter/material.dart';
import 'package:ramdomizer/vars.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyanAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                "rand",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/mainPage');
              },
            ),

            //add new member button, routes to add member page
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                onPressed: () {
                  //shifting add user page
                  Navigator.pushNamed(context, '/thirdPage');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white10,
                  elevation: 10,
                  side: BorderSide(color: Colors.cyan, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 80,
                ),

              ),
            ),MaterialApp(home: Scaffold(body: InputChip(label: Text("ss")),),)

          ],
        ),
      ),
    );
  }
}
