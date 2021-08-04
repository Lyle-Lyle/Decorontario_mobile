import 'package:flutter/material.dart';
import 'type.dart';

class  searchBarDelegate extends SearchDelegate<String> {

  @override
  List<Widget>buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: ()=>query="",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress:transitionAnimation),
      onPressed: ()=>close(context,null.toString()),
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child:Container(
        width: 100,
        height: 100,
        child:Card(
          color: Colors.redAccent,
          child: Text(query),
        ),
      ),
    );

  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList=query.isEmpty?
    reecntSuggest:serchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length==0?0:suggestionList.length,
      itemBuilder: (context ,index)=>ListTile(
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                    text:suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey
                    )
                )
              ]
          ),
        ),
      ),
    );
  }

}