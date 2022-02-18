import 'package:flutter/material.dart';
import 'package:fooseonline/assets/app_color.dart';
import 'package:fooseonline/assets/contact_dialog.dart';


class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  List <String> sideBarlogos=[
    "images/gender.png",
    "images/male logo.png",
    "images/female logo.png",
    "images/kids logo.png",
  ];

  int selected=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: Column(
              children: List.generate(sideBarlogos.length, (sideBarIndex){

                void onTap(){
                  setState(() {
                    selected=sideBarIndex;
                  });
                }

                return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10,),
                    width: 50,
                    height:50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color:selected==sideBarIndex?Colors.amber.withOpacity(.8):Colors.grey.withOpacity(.5),
                        image: DecorationImage(
                            image: AssetImage(sideBarlogos[sideBarIndex])
                        )
                    ),
                  ),
                );
              })
          )),

          GestureDetector(
            
            onTap: (){
              return ContactDialog().ContactDalogBox(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
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


