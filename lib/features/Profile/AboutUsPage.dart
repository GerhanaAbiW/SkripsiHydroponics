import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/App_Text_Style.dart';

var darkGreenColor = Color(0xFF689F38);

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: darkGreenColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'About Us',
          style: CustomTextStyle.textFormFieldBold
              .copyWith(color: Colors.white, fontSize: 21),
        ),
      ),
      body: SingleChildScrollView(
        child:

            //color: Colors.white,
            //padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
            Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
          child: Column(
            children: <Widget>[
              Text(
                "HydroAsik.corp",
                style: CustomTextStyle.textFormFieldBold
                    .copyWith(fontSize: 20, color: Colors.grey.shade800),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "HydroAsik hadir untuk bisa menjadi partner anda dalam belajar menanam secara hidroponik. Anda bisa menemukan berbagai tips dan trik ber hidroponik di Aplikasi ini. ",
                style: CustomTextStyle.textFormFieldMedium
                    .copyWith(fontSize: 18, color: Colors.grey.shade800),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Kami juga menyediakan semua kebutuhan anda dalam belajar menanam sayuran daun hidroponik kesukaan anda. kami berharap Aplikasi ini bisa menjadi wahana belajar anda dalam dunia hidroponik. Untuk melengkapi belajar anda tentu saja kami juga menyediakan berbagai kebutuhan alat bahan hidroponik yang lengkap dan murah.Semua kebutuhan mengenai hidroponik ada disini seperti netpot, nutrisi hidroponik,starterkit hidroponik, paket pemula hidroponik, fertigasi dll.",
                style: CustomTextStyle.textFormFieldMedium
                    .copyWith(fontSize: 18, color: Colors.grey.shade800),
              ),
              SizedBox(height: 16),
              Text(
                "Semoga bermanfaat, mari belajar hidroponik bersama kami",
                style: CustomTextStyle.textFormFieldMedium
                    .copyWith(fontSize: 18, color: Colors.grey.shade800),
              ),
            ],
          ),
        ),
      ),
      //),
    );
  }
}
