import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydroponics/core/Router/ChangeRoute.dart';
import 'package:hydroponics/features/MenuHydroOrder/HydroOrderCustomDetail.dart';
import 'package:hydroponics/features/MenuHydroOrder/HydroOrderDetail.dart';
import 'package:hydroponics/features/MenuHydroOrder/ViewModel/DetailType.dart';
import 'package:hydroponics/features/MenuLearning/LearningVideo/LearningVideoDetail.dart';

class NewHydroOrderList extends StatefulWidget {
  @override
  _NewHydroOrderListState createState() => _NewHydroOrderListState();
}

class _NewHydroOrderListState extends State<NewHydroOrderList>
    with SingleTickerProviderStateMixin {
  // TabController _tabController;
  PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _hydroSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          if (index < 3) {
            changeScreen(
                context,
                HydroOrderDetail(
                  hydroType: types[index],
                ));
          } else {
            changeScreen(
                context,
                HydroOrderCustomDetail(
                  hydroType: types[index],
                ));
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF03A9F4), //Color(0xFF32A060),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: types[index].image,
                      child: Image(
                        height: 280.0,
                        width: 280.0,
                        image: AssetImage(
                          types[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'FROM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          types[index].price,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          types[index].type.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          types[index].landType,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 4.0,
            //   child: RawMaterialButton(
            //     padding: EdgeInsets.all(15.0),
            //     shape: CircleBorder(),
            //     elevation: 2.0,
            //     fillColor: Colors.black,
            //     child: Icon(
            //       Icons.add_shopping_cart,
            //       color: Colors.white,
            //       size: 30.0,
            //     ),
            //     onPressed: () => print('Add to cart'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 60.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Hydro Order',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  //       Icon(
                  //         Icons.shopping_cart,
                  //         size: 30.0,
                  //         color: Colors.black,
                  //       ),
                ],
              ),
            ),

            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Choose type of hydroland that you want ',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // TabBar(
            //   controller: _tabController,
            //   indicatorColor: Colors.transparent,
            //   labelColor: Colors.black,
            //   unselectedLabelColor: Colors.grey.withOpacity(0.6),
            //   labelPadding: EdgeInsets.symmetric(horizontal: 35.0),
            //   isScrollable: true,
            //   tabs: <Widget>[
            //     Tab(
            //       child: Text(
            //         'Top',
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     Tab(
            //       child: Text(
            //         'Outdoor',
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     Tab(
            //       child: Text(
            //         'Indoor',
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     Tab(
            //       child: Text(
            //         'New Arrivals',
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //     Tab(
            //       child: Text(
            //         'Limited Edition',
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 40.0),
            Container(
              height: 500.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                itemCount: types.length,
                itemBuilder: (BuildContext context, int index) {
                  return _hydroSelector(index);
                },
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(30.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         'Description',
            //         style: TextStyle(
            //           fontSize: 22.0,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       SizedBox(height: 10.0),
            //       Text(
            //         types[_selectedPage].description,
            //         style: TextStyle(
            //           color: Colors.black87,
            //           fontSize: 16.0,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
