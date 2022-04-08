import 'package:flutter/material.dart';
import 'package:fooseonline/assets/contact_dialog.dart';
import 'package:fooseonline/assets/post.dart';



class SideBar extends StatefulWidget {
   SideBar({Key? key}) : super(key: key);

   int unisexIndex=0;
   int maleIndex=1;
   int femaleIndex=2;
   int kidsIndex=3;

   int selected=0;


  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  SideBar obj=SideBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    obj.selected=obj.unisexIndex;
                  });
                },
                child: Container(
                  margin:EdgeInsets.only(bottom: 10),
                  width: 50,
                  height:50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color:obj.selected==obj.unisexIndex?Colors.amber.withOpacity(0.5):Colors.grey.withOpacity(0.3),
                      image: const DecorationImage(
                          image: AssetImage("images/gender.png")
                      )
                  ),
                ),
              ),GestureDetector(
                onTap: (){
                  setState(() {
                    obj.selected=obj.maleIndex;
                  });
                },
                child: Container(
                  margin:EdgeInsets.only(bottom: 10),
                  width: 50,
                  height:50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color:obj.selected==obj.maleIndex?Colors.amber.withOpacity(0.5):Colors.grey.withOpacity(0.3),
                      image: const DecorationImage(
                          image: AssetImage("images/male logo.png")
                      )
                  ),
                ),
              ),GestureDetector(
                onTap: (){
                  setState(() {
                    obj.selected=obj.femaleIndex;
                  });
                },
                child: Container(
                  margin:EdgeInsets.only(bottom: 10),
                  width: 50,
                  height:50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color:obj.selected==obj.femaleIndex?Colors.amber.withOpacity(0.5):Colors.grey.withOpacity(0.3),
                      image: const DecorationImage(
                          image: AssetImage("images/female logo.png")
                      )
                  ),
                ),
              ),GestureDetector(
                onTap: (){
                  setState(() {
                    obj.selected=obj.kidsIndex;
                  });
                },
                child: Container(
                  margin:EdgeInsets.only(bottom: 10),
                  width: 50,
                  height:50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color:obj.selected==obj.kidsIndex?Colors.amber.withOpacity(0.5):Colors.grey.withOpacity(0.3),
                      image: const DecorationImage(
                          image: AssetImage("images/kids logo.png")
                      )
                  ),
                ),
              ),

            ],
          ),
        ),

/////////////////////////////////////////////////////////////////////////////////////////////////////////
      //This is for the contact button
        GestureDetector(
          onTap: (){
            return ContactDialog().createContactDialog(context);
          },
          child: Container(
            margin:EdgeInsets.only(bottom: 15,),
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
    );
  }
}



