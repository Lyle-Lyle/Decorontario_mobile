import 'package:new_version/pages/tabs/woocommerce_api.dart';
import 'package:flutter/material.dart';
import 'ItemInfoDetail.dart';
import 'type.dart';

class  searchBarDelegate extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation),
      onPressed: () => close(context, null.toString()),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Card(
          color: Colors.redAccent,
          child: Text(query),
        ),
      ),
    );
  }


  Future _getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://uwindsor-project.tech/",
        consumerKey: "ck_f88c91548f1507adfdbfc6fd669d0df5dd5b279c",
        consumerSecret: "cs_060903ee6d465a114b6142c652ec0f3a501b87a4");

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");
    return products;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: _getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final suggestionList = query.isEmpty ?
          reecntSuggest : serchList.where((input) => input.startsWith(query))
              .toList();
          return ListView.builder(
            itemCount: suggestionList.length == 0 ? 0 : suggestionList.length,
            itemBuilder: (context, index) =>
                ListTile(
                  onTap: () {
                    for(var i=0; i<8;i++)
                    {
                      if (snapshot.data[i]["name"].toLowerCase() == suggestionList[index].toLowerCase())
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (cx)=>ItemInfoDetail(snapshot: snapshot,index: i,)));
                      }
                    }
                  },
                  title: RichText(

                    text: TextSpan(
                        text: suggestionList[index].substring(0, query.length),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold
                        ),
                        children: [
                          TextSpan(
                              text: suggestionList[index].substring(
                                  query.length),
                              style: TextStyle(color: Colors.grey
                              )
                          )
                        ]
                    ),
                  ),
                ),
          );
        }
    );
  }
}
