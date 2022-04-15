import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ramdomizer/mainScreen.dart';
import 'package:ramdomizer/vars.dart';

class AddPeople extends StatefulWidget {
  const AddPeople({Key? key}) : super(key: key);

  @override
  _AddPeopleState createState() => _AddPeopleState();
}

class _AddPeopleState extends State<AddPeople> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Consts consts = Consts();

    void validation() {
      //close the keyboard. TODO
      if (controller.text.isNotEmpty && ModelForAvatarRow.isAnyAvatarSelected == true) {
        ModelForAvatarRow.enteredName = controller.text;
          ModelMember.addNewMember();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${controller.text} is added!"),
        ));
      } else {
        if (controller.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You need to enter a name!')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You need to pick an avatar!')),
          );
        }
      }
      log("${ModelMember.members.length}");
    }

    Widget EnterNameTextField() {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextField(
          maxLength: 20,
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: controller,
          keyboardType: TextInputType.name,
          onTap: () {},
          decoration: const InputDecoration(
            hintText: "name",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            label: Text(
              "enter name",
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
            prefixIcon: Icon(
              Icons.face_retouching_natural_outlined,
              color: Colors.black45,
            ),
          ),
        ),
      );
    }

    Widget AvatarSelectionRow() {
      return //avatars row
          Expanded(
        flex: 1,
        child: Container(
          child: AvatarWidget(), //avatars.AvatarBuilder(),
        ),
      );
    }

    Widget ValidateButton() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
            ),
            onPressed: () {
              validation();
            },
            child: const Text('add'),
          ),
        ),
      );
    }

    Widget MemberList() {
      return Expanded(
        flex: 5,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
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
              onPressed: () {},
              child: addPageListTileWidget(index: index,), //gonna change
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
        automaticallyImplyLeading: true,
        /*actionsIconTheme:
            const IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
        title: const Text("baslik"),
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){Navigator.popAndPushNamed(context, '/');},),
*/
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
              )),
        ],
        backgroundColor: Consts().lgreen1(),
      ),*/
      backgroundColor: Consts().lgreen0(),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            EnterNameTextField(),
            AvatarSelectionRow(),
            ValidateButton(),
            const Divider(
              indent: 25.0,
              endIndent: 25.0,
              thickness: 2.0,
              color: Colors.black38,
            ),
            MemberList(),
          ],
        ),
      ),
    );
  }
}
