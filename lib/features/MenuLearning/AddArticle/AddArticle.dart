import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydroponics/core/Providers/ArticleProvider.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/core/constants/Costumized_Text_Field.dart';
import 'package:hydroponics/features/MenuLearning/AddArticle/AddArticle_viewmodel.dart';
import 'package:provider/provider.dart';

class AddArticleView extends StatefulWidget {
  @override
  _AddArticleViewState createState() => _AddArticleViewState();
}

class _AddArticleViewState extends State<AddArticleView> {
  bool isTrue = false;

  Radius topLeft;

  @override
  void initState() {
    super.initState();

    //Provider.of<NewPatientRegistrationViewModel>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   unFocus(context);
      // },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: GreenTosca,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Add Article',
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Consumer<AddArticleViewModel>(
                    builder: (context, model, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Lengkapi Data Untuk Article',
                          style: CustomTextStyle.textFormFieldBold
                              .copyWith(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            child: Stack(
                              // alignment: Alignment(0.75, 1.1),
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    width: 300,
                                    height: 300, //ScreenUtil().setWidth(88),
                                    child: model.profileImage != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(2.0),
                                                topRight:
                                                    const Radius.circular(2.0)
                                                //ScreenUtil().setWidth(44)
                                                ),
                                            child: Image.memory(
                                              model.profileImage,
                                              fit: BoxFit.cover,
                                              height:
                                                  300, //ScreenUtil().setWidth(88),
                                            ),
                                          )
                                        : model.imageUrl != null
                                            ? ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            2.0),
                                                    topRight:
                                                        const Radius.circular(
                                                            2.0)
                                                    //ScreenUtil().setWidth(44)
                                                    ),
                                                child: Image.network(
                                                  model.imageUrl,
                                                  fit: BoxFit.cover,
                                                  height:
                                                      // ScreenUtil().setWidth(88),
                                                      300,
                                                ),
                                              )
                                            : Image.asset('images/Icons/1.png'),
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  child: Image.asset('images/Icons/2.png'),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            print("Pressed");
                            model.selectImage();
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomizedTextField(
                          label: 'Author',
                          //controller: model.nameController
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: 1,
                              color: GreenTosca,
                            )),
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: <Widget>[
                              Text(
                                'Tanggal Lahir',
                                style: CustomTextStyle.textFormFieldBold
                                    .copyWith(
                                        color: Colors.black, fontSize: 15),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: <Widget>[
                                  // Provider.of<AddArticleViewModel>(context,listen: false).dateFormat.format();
                                  Text(model.dateFormat
                                      .format(model.selectedDate)),
                                  FlatButton(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Icon(Icons.arrow_drop_down),
                                      // child: Image(
                                      //   image: arrow,
                                      //   width: 56,
                                      //   height: 56,
                                      // ),
                                    ),
                                    onPressed: () => model.selectDate(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        CustomizedTextField(
                          label: 'Title',
                          //controller: model.nameController
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomizedTextField(
                          label: 'Article',
                          //controller: model.nameController
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: GreenTosca,
                            // gradient: LinearGradient(
                            //     colors: [
                            //       GreenTosca,
                            //       green,
                            //       CustomColors.COLOR_GREEN
                            //     ],
                            //     end: Alignment.centerLeft,
                            //     begin: Alignment.centerRight),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Add Plant",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
