import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ramdomizer/resultPage.dart';

class Consts {
  Consts();

  Color lgreen0() {
    return HexColor("#81c784");
  }

  Color lgreen() {
    return HexColor("#9ccc65");
  }

  Color lgreen1() {
    //dark green
    return HexColor("#43a047");
  }

  Color lgreen2() {
    return HexColor("#689f38");
  }

  Color lime() {
    return HexColor("#eeff41");
  }

  Color lime1() {
    return HexColor("#cddc39");
  }

  Color amber0(bool isSelected) {
    if (isSelected == false) {
      return Colors.amber;
    } else {
      return Colors.black;
    }
  }

  Color framesColor({
    Color color = Colors.white12,
  }) {
    return color;
  }

  Color colorOfListBoxes({Color color = Colors.black87}) {
    if (color != Colors.black87) {
      return color;
    } else {
      return lgreen0();
    }
  }

  Color backroundColor({Color color = Colors.black87}) {
    if (color != Colors.black87) {
      return color;
    } else {
      return lgreen0();
    }
  }

  List<Color> checkBoxColors(
      {Color tickColor = Colors.black87,
      Color boxOutLineColor = Colors.transparent,
      Color boxBackgroundColor = Colors.transparent}) {
    return [tickColor, boxOutLineColor, boxBackgroundColor];
  }
}

class ModelMember {
  bool? amISelected;
  String? name;
  int imageNum;
  ModelMember({this.name = "Nan", this.imageNum = 0, this.amISelected = false});

  static List<ModelMember> members = [
    ModelMember(imageNum: 0, name: "Mustafa"),
    ModelMember(imageNum: 1, name: "Ayşegül"),
    ModelMember(imageNum: 8, name: "Şule"),
    ModelMember(),
    ModelMember(),
    ModelMember(),
    ModelMember(),
    ModelMember(),
    ModelMember(),
    ModelMember(),
    ModelMember(),
  ];

  //add new member to list
  static void addNewMember() {
    members.add(ModelMember(
        name: ModelForAvatarRow.enteredName,
        imageNum: ModelForAvatarRow.selectedAvatarNum));
    ModelForAvatarRow.enteredName = null;
  }
}

class ModelForAvatarRow {
  bool select;
  double radiuss = 31;
  static bool isAnyAvatarSelected = false;
  static int selectedAvatarNum = 0;
  static String? enteredName = "";

  ModelForAvatarRow({this.radiuss = 31, this.select = false});

  static List<Image> img = [
    Image.asset('assets/avatars/1.jpg'),
    Image.asset('assets/avatars/2.jpg'),
    Image.asset('assets/avatars/3.jpg'),
    Image.asset('assets/avatars/4.jpg'),
    Image.asset('assets/avatars/5.jpg'),
    Image.asset('assets/avatars/6.jpg'),
    Image.asset('assets/avatars/7.jpg'),
    Image.asset('assets/avatars/8.jpg'),
    Image.asset('assets/avatars/9.jpeg'),
  ];

  //create prep avatar model until you reached your asset picture number.
  //do not create more than asset picture number that is in assests/avatar folder
  static List<ModelForAvatarRow> models = [
    ModelForAvatarRow(),
    ModelForAvatarRow(),
    ModelForAvatarRow(),
    ModelForAvatarRow(),
    ModelForAvatarRow(),
    ModelForAvatarRow(),
    ModelForAvatarRow(),
    ModelForAvatarRow(),
    ModelForAvatarRow(),
  ];

  static void makeRestFalse(int except) {
    isAnyAvatarSelected = true;

    for (int i = 0; i < models.length; i++) {
      if (i != except) {
        models[i].select = false;
        models[i].radiuss = 31;
      } else {
        selectedAvatarNum = except;
        continue;
      }
    }
  }
}

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  Widget Avatar(int avatarNum) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.black,
        child: RawMaterialButton(
          onPressed: () {
            setState(() {
              log(' message$avatarNum ${ModelForAvatarRow.models[avatarNum].radiuss}');
              ModelForAvatarRow.models[avatarNum].radiuss = 35;
              log(' message$avatarNum ${ModelForAvatarRow.models[avatarNum].radiuss}');
              ModelForAvatarRow.makeRestFalse(avatarNum);
            });
          },
          child: CircleAvatar(
            backgroundImage: ModelForAvatarRow.img[avatarNum].image,
            radius: ModelForAvatarRow.models[avatarNum].radiuss,
          ),
        ),
      ),
    );
  }

  Widget AvatarBuilder() {
    return ListView.builder(
      itemBuilder: (context, index) => Avatar(index),
      scrollDirection: Axis.horizontal,
      itemCount: ModelForAvatarRow.models.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AvatarBuilder();
  }
}

class SelectableMemberListTile extends StatefulWidget {
  int index;
  SelectableMemberListTile({Key? key, this.index = 0}) : super(key: key);

  @override
  State<SelectableMemberListTile> createState() =>
      _SelectableMemberListTileState();
}

class _SelectableMemberListTileState extends State<SelectableMemberListTile> {
  String msgState = "";
  Consts consts = Consts();
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text("${ModelMember.members[widget.index].name}"),
      value: ModelMember.members[widget.index].amISelected,
      checkColor: consts.checkBoxColors()[0],
      activeColor: consts.checkBoxColors()[1],
      selectedTileColor: consts.checkBoxColors()[2],
      secondary: Padding(
        padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
        ),
        child: CircleAvatar(
          radius: 20, // Image radius
          backgroundImage: ModelForAvatarRow
              .img[ModelMember.members[widget.index].imageNum].image,
        ),
      ),
      onChanged: (bool? value) {
        //notify message
        setState(
          () {
            ModelMember.members[widget.index].amISelected = value;
            if (value == true) {
              msgState = " added";
              ResultPageModel.inputs.add(ModelMember.members[widget.index]);
            } else {
              msgState = " removed";
              ResultPageModel.inputs.remove(ModelMember.members[widget.index]);
            }
            //scaffold snackbar messager
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "${ModelMember.members[widget.index].name} " + msgState),
                duration: const Duration(
                  milliseconds: 250,
                ),
                action: SnackBarAction(
                  label: 'succesfully',
                  textColor: Colors.amber,
                  onPressed: () {
                    null;
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class addPageListTileWidget extends StatefulWidget {
  int? index;
  addPageListTileWidget({Key? key, this.index}) : super(key: key);

  @override
  State<addPageListTileWidget> createState() => _addPageListTileWidgetState();
}

class _addPageListTileWidgetState extends State<addPageListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: ModelForAvatarRow
            .img[ModelMember.members[widget.index!].imageNum].image,
        radius: 20,
      ),
      title: Text("${ModelMember.members[widget.index!].name}"),
      enabled: true,
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            ModelMember.members.removeAt(widget.index!);
            log("${ModelMember.members.length}");
          });
        },
      ),
    );
  }
}



class chipsClass extends StatefulWidget {
  const chipsClass({Key? key}) : super(key: key);

  @override
  State<chipsClass> createState() => _chipsClassState();
}

class _chipsClassState extends State<chipsClass> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: const Text('AB'),
      ),
      label: const Text('Aaron Burr'),
    );
  }
}
