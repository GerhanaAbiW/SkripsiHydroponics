import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:hydroponics/core/Providers/PlantProvider.dart';
import 'package:hydroponics/core/Providers/ProductProvider.dart';
import 'package:hydroponics/features/MenuAdmin/ManageProduct/ProductCard.dart';
import 'package:hydroponics/features/MenuAdmin/ManageProduct/ProductSearchScreen.dart';
import 'package:hydroponics/features/MenuMyPlants/AddMyPlants/AddMyPlantCard.dart';
import 'package:hydroponics/features/Widget/SearchPlant.dart';
import 'package:hydroponics/features/Widget/SearchProduct.dart';
import 'package:hydroponics/features/Widget/SearchVideo.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context,listen: false).loadProducts();
  }
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
            child: SearchProduct(
          widget: ProductSearchScreen(),
          search: "Search Product..",
        )),
        Container(
            height: MediaQuery.of(context).size.height - 300.0,
            //height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(70.0)),
            ),
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height / 2,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child: productProvider.products.length == 0 ||
                    productProvider.products.length == null
                ? Padding(
                    padding: const EdgeInsets.all(125.0),
                    child: Image.asset('images/not_found.png'),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: productProvider.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        child: ProductCard(
                          productModel: productProvider.products[index],
                        ),
                      );
                      // return Card(
                      //     elevation: 10.0,
                      //     child: InkWell(
                      //       onTap: () {
                      //         Navigator.of(context).push(MaterialPageRoute(
                      //             builder: (context) => MyPlantsDetail()));
                      //       },
                      //       child: ListTile(
                      //         leading: CircleAvatar(
                      //           radius: 30,
                      //           backgroundImage:
                      //               ExactAssetImage("images/plant.png"),
                      //         ),
                      //         title: Text(title[index],
                      //             style: TextStyle(fontSize: 14)),
                      //         subtitle:
                      //             Text(desc[index], style: TextStyle(fontSize: 10)),
                      //       ),
                      //     ));
                    },
                  )),
      ],
    );
  }
}
