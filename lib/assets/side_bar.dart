import 'package:flutter/material.dart';
import 'package:fooseonline/assets/contact_dialog.dart';
import 'package:fooseonline/assets/post.dart';
import 'package:state_set/state_set.dart';


class SideBar extends StatefulWidget {
   SideBar({Key? key}) : super(key: key);

   int selected=0;

  List <String> sideBarlogos=[
    "images/gender.png",
    "images/male logo.png",
    "images/female logo.png",
    "images/kids logo.png",
  ];

  List   selectors=[
    Post().unisexSelected(),
    Post().malesSelected(),
    Post().femalesSelected(),
    Post().kidsSelected()
  ];


  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with StateSet {
  SideBar sidebar=SideBar();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: Column(
              children: List.generate(sidebar.sideBarlogos.length, (sideBarIndex){

                void onTap(){
                  setState(() {
                    sidebar.selected=sideBarIndex;
                  });
                }

                return GestureDetector(
                  onTap: (){
                    onTap();

                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10,),
                    width: 50,
                    height:50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color:sidebar.selected==sideBarIndex?Colors.amber.withOpacity(.8):Colors.grey.withOpacity(.5),
                        image: DecorationImage(
                            image: AssetImage(sidebar.sideBarlogos[sideBarIndex])
                        )
                    ),
                  ),
                );
              })
          )),

          GestureDetector(
            onTap: (){
              return ContactDialog().createContactDialog(context);
            },
            child: Container(
              margin:EdgeInsets.only(bottom: 15),
              width: 50,
              height:50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color:Colors.amber,
                  image: const DecorationImage(
                      image: AssetImage("images/phone.png")
                  )
              ),
            ),
          ),

        ],
      ),
    );
  }
}



