import 'package:flutter/material.dart';
import 'package:fooseonline/assets/app_text.dart';
import 'package:fooseonline/connections/contacts.dart';

class ContactDialog{

  createContactDialog(BuildContext context) {

    return showDialog (

        context: context, builder: (context){

      return AlertDialog(
        title: AppText(text:"Contact us on:",color: Colors.black,),
        content: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  Contact().openWhatsappChat();
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("images/whatsapp logo.png")
                    )
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Contact().openPhone();
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,

                  ),
                  child: Icon(Icons.phone_forwarded,size: 40,color: Colors.black54,),
                ),
             )
            ],
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),

            child:TextButton(onPressed: () {
              return Navigator.pop(context);
            },
              child: AppText(text: "Cancel",color: Colors.red,),) ,
          ),

        ],
        elevation: 24,
        backgroundColor: Colors.white,
      );
    });
  }


}




// class ContactDialog extends StatefulWidget {
//   const ContactDialog({Key? key}) : super(key: key);
//
//   @override
//   _ContactDialogState createState() => _ContactDialogState();
// }
//
// class _ContactDialogState extends State<ContactDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: AppText(text:"Contact us on:"),
//       content: Text("do you accept"),
//       actions: [
//         TextButton(onPressed: () {  },
//         child: AppText(text: "yes",),),
//         TextButton(onPressed: () {  },
//           child: AppText(text: "no",),)
//       ],
//       elevation: 24,
//       backgroundColor: Colors.blue,
//     );
//   }
// }
