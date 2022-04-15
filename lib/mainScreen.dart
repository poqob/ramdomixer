import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ramdomizer/vars.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override

  /*
  void initState() {
    super.initState();
    setState(() {});
    ///whatever you want to run on page build
  }*/

  Widget build(BuildContext context) {
    Consts consts = Consts();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(),
      backgroundColor: consts.backroundColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListArea(),
            SizedBox(
              height: 10,
              width: width - 50,
            ),
            MixButtonArea(context),
          ],
        ),
      ),
    );
  }
}

AppBar appBar (){
  return AppBar(
        backgroundColor: Consts().lgreen0(),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          'Members',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontStyle: FontStyle.italic),
          softWrap: true,
        ),
      );
}

Widget ListArea() {
  return const Flexible(
    flex: 4,
    child: Profiles(),
  );
}

Widget MixButtonArea(BuildContext context) {
  Consts consts = Consts();
  return Flexible(
    flex: 1,
    child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white10,
                elevation: 10,
                side: BorderSide(color: consts.framesColor(), width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                //show pop up page
              },
              child: const Icon(
                Icons.refresh_outlined,
                size: 80,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  // that number will be dynamic .
  Consts consts = Consts();
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        //how many box list view will build
        itemCount: ModelMember.members.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: consts.colorOfListBoxes(),
              elevation: 8,
              side: const BorderSide(color: Colors.transparent, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {
              null;
            },
            child: SelectableMemberListTile(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
