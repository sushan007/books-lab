import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeky_booky/searchProduct.dart';

class SearchBoxDelegate extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return InkWell(
      onTap: (){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SearchProducts()));
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: InkWell(
          child: Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.lightGreenAccent,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:8.0),
                  child: Text("Search here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }

}