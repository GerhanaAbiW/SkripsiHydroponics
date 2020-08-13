import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  var ProductOnCart = [
    {
      "name": "Bayam",
      "picture": "images/bayam.jpeg",
      "price": 100,
      "quantity": 3,
    },
    {
      "name": "Bayam",
      "picture": "images/bayam.jpeg",
      "price": 100,
      "quantity": 3,
    },
    {
      "name": "Bayam",
      "picture": "images/bayam.jpeg",
      "price": 100,
      "quantity": 3,
    },
    {
      "name": "Bayam",
      "picture": "images/bayam.jpeg",
      "price": 100,
      "quantity": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return new SingleCart(
            cartProductPicture: ProductOnCart[index]["picture"],
            cartProductName: ProductOnCart[index]["name"],
            cartProductPrice: ProductOnCart[index]["price"],
            cartProductQuantity: ProductOnCart[index]["quantity"],
          );
        });
  }
}

class SingleCart extends StatelessWidget {
  final cartProductPicture;
  final cartProductName;
  final cartProductPrice;
  final cartProductQuantity;

  SingleCart(
      {this.cartProductPicture,
      this.cartProductName,
      this.cartProductPrice,
      this.cartProductQuantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //leading section
        leading: new Image.asset(cartProductPicture, width: 80.0, height: 80.0),
        //title section
        title: new Text(cartProductName),
        subtitle: new Column(children: <Widget>[
          //Row inside the column
          new Row(
            children: <Widget>[
              Expanded(
                child: new Text("Size: "),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: new Text("size"),
              ),
              new Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                child: new Text("Color: "),
              ),
              Padding(
                  padding: const EdgeInsets.all(4.0), child: new Text("color"))
            ],
          ),

          new Container(
              alignment: Alignment.topLeft,
              child: new Text("\$${cartProductPrice}",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700])))
        ]),

        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
            new Text("$cartProductQuantity"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {}),
          ],
        ),
      ),
    );
  }

// void addQty(){
//   cartProductQuantity = cartProductQuantity + 1
// }
}
