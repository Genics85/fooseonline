import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
        decoration: InputDecoration(
          hintText: "Search by name or Cartegory",
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
