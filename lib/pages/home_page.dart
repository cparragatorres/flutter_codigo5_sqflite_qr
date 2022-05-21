import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/widgets/item_list_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kFontPrimaryColor),
        title: const Text(
          "VacunApp Storage",
          style: TextStyle(
            color: kFontPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mis carnets registrados",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  ItemListWidget(),
                  ItemListWidget(),
                  ItemListWidget(),
                  ItemListWidget(),
                  ItemListWidget(),
                  ItemListWidget(),
                  ItemListWidget(),
                  ItemListWidget(),
                  ItemListWidget(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 52.0,
              width: double.infinity,
              margin: const EdgeInsets.all(12.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text("Escaner QR"),
                icon: SvgPicture.asset(
                  'assets/icons/bx-qr-scan.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
