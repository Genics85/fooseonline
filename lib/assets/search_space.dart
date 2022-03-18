import 'package:flutter/material.dart';

// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);
//
//   @override
//   _SearchState createState() => _SearchState();
// }

class Search extends StatelessWidget {

  TextEditingController controller= TextEditingController();

  Search({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 40,
      width: MediaQuery.of(context).size.width*0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search eg. shirt,skirt,trousers",
          border: InputBorder.none,
          focusColor: Colors.black,
          suffixIcon: IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
            onPressed: () {  },
          )
        ),
      ),
    );
  }
}
