import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Payment.dart';

class PaymentCard extends StatefulWidget {
  final PaymentModel paymentModel;
  const PaymentCard({Key key, this.paymentModel}) : super(key: key);

  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, //MediaQuery.of(context).size.height,
      child: Card(
          elevation: 10.0,
          child: InkWell(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => LearningArticleDetail(article:
                //     articleProvider.articles[index])));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 70, //ScreenUtil().setWidth(60),
                              height: 60, //ScreenUtil().setWidth(60),
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(),
                              ),
                              child:
                              widget.paymentModel.image !=
                                  null
                                  ? Image.network(
                                '${widget.paymentModel.image}',
                                fit: BoxFit.fill,
                              )
                                  : Image.asset("images/bayam.jpeg")),
                        ),
                        SizedBox(width: 3.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                  width:
                                  MediaQuery.of(context).size.width *
                                      0.6,
                                  child: Text(
                                      "${widget.paymentModel.total}",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                      widget.paymentModel.status,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.grey)),
                                )
                              ]),
                        )
                      ])),
                ],
              ))),
    );
  }
}
