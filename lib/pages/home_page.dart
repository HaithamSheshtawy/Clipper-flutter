import 'package:eccomerce/core/const.dart';
import 'package:eccomerce/core/flutter_icons.dart';
import 'package:eccomerce/models/shoe_model.dart';
import 'package:eccomerce/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoeModel> list = ShoeModel.list;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            FlutterIcons.menu,
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black26,
                      ),
                      onPressed: null)
                ],
              )),
          Container(
            height: 300,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return Container(
                    width: 230,
                    margin: EdgeInsets.only(right: 16),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: _buildBackGround(index, 230),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -50,
                          child: Transform.rotate(
                            angle: -math.pi / 7,
                            child: Image(
                              image: AssetImage(
                                "assets/${list[index].imgPath}",
                              ),
                              width: 220,
                              height: 350,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Just for you',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                Text(
                  'View All',
                  style: TextStyle(color: AppColors.greenColor, fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          ...list.map((data) {
            return Container(
              margin: EdgeInsets.only(left: 16, right: 5, bottom: 16),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 1, spreadRadius: 1)
                  ]),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("assets/${data.imgPath}"),
                    width: 100,
                    height: 60,
                  ),
                  // SizedBox(width:8),
                  Expanded(
                    child: Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Text(
                          '${data.name}',
                          maxLines: 1,
                          style: TextStyle(color: Colors.black26),
                          textWidthBasis: TextWidthBasis.longestLine,
                        ),
                      ),
                      Text(
                        '${data.brand}',
                        style: TextStyle(color: Colors.black26),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "\$${data.price.toInt()}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.5),
                    ),
                  )
                ],
              ),
            );
          })
        ]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 1, blurRadius: 10)
              ]),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.greenColor,
            unselectedItemColor: Colors.black26,
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(FlutterIcons.compass),
                  ),
                  title: Text('data')),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.list), title: Text('data')),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.badge), title: Text('data')),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.compass), title: Text('data')),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.person_outline), title: Text('data')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackGround(int index, double _width) {
    return ClipPath(
      clipper: AppClipper(cornerRedius: 25, diagonalHeight: 100),
      child: Container(
        color: list[index].color,
        width: _width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Icon(
                        list[index].brand == 'Nike'
                            ? Icons.check
                            : Icons.star,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      width: 125,
                      child: Text(
                        list[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      list[index].price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                  ]),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(10))),
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
