import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController searchTextFieldController;

  const MySearchBar({Key? key, required this.searchTextFieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: searchTextFieldController,
        style: TextStyle(color: Colors.white),
        decoration:  const InputDecoration(
          hintText: "Show name...",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          prefixIcon:  Icon(Icons.search,color: Colors.white,),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3),
          ),
        ),
      ),
    );
  }
}