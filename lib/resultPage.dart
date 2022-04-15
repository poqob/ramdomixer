import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ramdomizer/vars.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(),
    );
  }
}

class ResultPageModel {
  //take inputs from who is selected, whose amISelected value = true are in this list
  static List<ModelMember> inputs = [];

  //generates dynamic mix choices

  //mix inputs list according to mix choice

  void remaindlessDivision(int listLength) {
    for (int i = 1; i < listLength; i++) {
      if (listLength % i == 0) {
        log("($listLength X $i)");
        //send listLength and i to an widget generator.
      }
    }
  }

  



  /*
  algorithm of remainderless division

  take inputs list lenght and attempt it to a variable,

  generates numbers from 0 to inputs.lenght ->for loop,

  take mod inputs.lenght with each generated numbers,

  take generated numbers that is make mod operation's outcome 0 and attempt it to a groupNum variable,

  take mod operation's result/outcome and attempt it to a groupMemberNum variable,

  create as many containers as the groupNum

  attempt random members to in that containers 

  a function reverses groupNum and groupMemberNum with each other.


  these steps works in statefull widget and reflesh itself dynamicly while user select or unselect members 

  or 

  these steps works after 2 seconds of last choices 





  and 

  
  */
}
